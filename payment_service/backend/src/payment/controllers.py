import pycard
import uuid
import time

from random import randint
from flask import Blueprint, make_response, request, jsonify, g

from src.database.pg import connect_to_db as connect_to_db
from src.payment.model import Payment as payment_model
from src.payment.queries import create, find_charge_and_payment, update, find_failed_payments
from src.credit_card import queries as cc_queries
from src.rabbitmq.rmq import ack_message, produce

payment = Blueprint('payment', __name__)

def ack_rabbitmq_msg(channel=None, delivery_tag=None):
  ack_message(channel, delivery_tag)

def retry_failed_payments():
  db = connect_to_db()
  rows = find_failed_payments(db)
  for row in rows:
    cc = { 'exp_month': row['exp_month'], 'exp_year': row['exp_year'], 'cvc': row['cvc'] }
    if not is_cc_expired(cc):  
      row['attempts'] += 1

      # simular... se for <= 75 é pq deu certo.
      time.sleep(15)
      if randint(0, 100) <= 75:
        row['paid'] = True
        produce('order-update', { 'status': 'PAID', 'order_id': row['order_id'] })

      if row['attempts'] == 3 and row['paid'] == False:
        produce('order-update', { 'status': 'CANCELLED', 'order_id': row['order_id'] })

      update(row['paid'], row['charge_id'], row['attempts'], db)
    else:
      produce('order-update', { 'status': 'CANCELLED', 'order_id': row['order_id'] })

  db.close()

def is_cc_expired(cc):
  # We will check if is expired...
  # We already validated this credit card
  card = pycard.Card(
    number='4242424242424242',
    month=cc['exp_month'],
    year=cc['exp_year'],
    cvc=cc['cvc']
  )

  return card.is_expired

def check_creditcard_and_pay(_payment, is_rabbitmq=False, channel=None, delivery_tag=None):
  if g:
    db = g.db
  else:
    db = connect_to_db()

  cc = cc_queries.__find_by_id(_payment['client_id'], _payment['payment_id'], db)

  if cc is None:
    res,status =  {'status': 'ERROR', 'msg': 'Forma de pagamento não encontrada...'}, 404
  else:
    if not is_cc_expired(cc) and cc['cvc'] == _payment['cvc']:
      _payment['id'] = 'charge_%s' % uuid.uuid4()

      # simular... se for <= 75 é pq deu certo.
      time.sleep(15)
      if randint(0, 100) <= 75:
        # ok
        _payment['paid'] = True
        res, status = {'status': 'OK', 'data': {
          'id': _payment['id'],
          'amount': _payment['amount'],
          'paid': _payment['paid'],
          'source': cc
        }}, 201
        
        produce('order-update', { 'status': 'PAID', 'order_id': _payment['order_id'] })
      else:
        _payment['paid'] = False
        res, status = {'status': 'ERROR', 'msg': 'Pagamento não autorizado.'}, 402

      create(_payment, db)
    else:
      res, status = {'status': 'ERROR', 'msg': 'Forma de pagamento inválido.'}, 402
    
  if is_rabbitmq:
    ack_rabbitmq_msg(channel, delivery_tag)

  if g is None:
    db.close()

  return res, status

@payment.route('/', methods=["POST"])
def pay():
  _payment = request.json
  err = payment_model(_payment).validate()
  print(err)
  
  if len(err) > 0:
    return make_response(jsonify({'status': 'ERROR', 'msg': err}), 400)
  else:
    res, status = check_creditcard_and_pay(_payment)
    if status == 201:
      produce('order-update', { 'status': 'PAID', 'order_id': _payment['order_id'] })

    return make_response(jsonify(res), status)

@payment.route('/<string:payment_id>/charge/<string:charge_id>/retry', methods=["POST"])
def retry(payment_id, charge_id):
  # We will check if is expired...
  # We already validated this credit card
  row = find_charge_and_payment(payment_id, charge_id, g.db)
  card = pycard.Card(
    number='4242424242424242',
    month=row['exp_month'],
    year=row['exp_year'],
    cvc=row['cvc']
  )

  if not card.is_expired and not row['paid']:
    # simular... se for <= 80 é pq deu certo.
    if randint(0, 100) <= 80:
      # ok
      row['paid'] = True
      res, status = ({'status': 'OK', 'data': {
        'id': row['charge_id'],
        'amount': row['amount'],
        'paid': row['paid'],
        'source': {
          'id': row['card_id'],
          'last4': row['last4'],
          'cvc': row['cvc'],
          'brand': row['brand'],
          'name': row['name'],
          'exp_month': row['exp_month'],
          'exp_year': row['exp_year']
        }
      }}, 200)
    else:
      row['paid'] = False
      res, status = ({'status': 'ERROR', 'msg': 'Pagamento não autorizado.'}, 402)
    
    update(row['paid'], row['charge_id'], row['attempts'] + 1,  g.db)
    return make_response(jsonify(res), status)

  return make_response(jsonify({'status': 'ERROR', 'msg': 'Pagamento já autorizado.'}), 402)
  
  