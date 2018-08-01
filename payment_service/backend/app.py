import os
import sys
import logging
import pika
import threading
import schedule
import time

from flask import Flask, make_response, request, jsonify, g

from src.database.pg import connect_to_db as connect_to_db
from src.credit_card.controllers import credit_card as cc_controllers
from src.payment.controllers import payment as payment_controllers
from src.payment.controllers import retry_failed_payments
from src.rabbitmq import rmq

PORT = os.getenv('PORT', 3344)

app = Flask(__name__)
app.register_blueprint(cc_controllers, url_prefix='/api/v1/card')
app.register_blueprint(payment_controllers, url_prefix='/api/v1/payment')

# Loggers
gunicorn_logger = logging.getLogger('gunicorn.error')
app.logger.handlers = gunicorn_logger.handlers
app.logger.setLevel(gunicorn_logger.level)

def start_rabbitMQ_consumer():
  print(' * Starting RabbitMQ')
  channel = rmq.connect()
  rmq.consume(channel)

def start_scheduler():
  print(' * Scheduler up and running.')
  while True:
    schedule.run_pending()
    time.sleep(1)

@app.before_request
def get_db():
  app.logger.info('Opening connection...')
  if 'db' not in g:
    g.db = connect_to_db()

@app.teardown_appcontext
def teardown_db(exception):
  db = g.pop('db', None)

  if db is not None:
    app.logger.info('Closing connection...')
    db.close()

@app.errorhandler(404)
def not_found(e):
  return make_response(jsonify({'status': 'ERROR', 'msg': 'URI nao encontrada.'}), 404)

@app.errorhandler(405)
def method_not_allowed(e):
  return make_response(jsonify({'status': 'ERROR', 'msg': 'Metodo nao permitido.'}), 405)

@app.errorhandler(500)
def internal_error(e):
  app.logger.critical(e)
  return make_response(jsonify({'status': 'ERROR', 'msg': 'Ops... Algo interno aconteceu.'}), 500)

@app.route('/health')
def health():
  cur = g.db.cursor()
  cur.execute('SELECT 1+1 as sum', [])
  if cur.fetchone()['sum'] == 2:
    return make_response("Healthy :D\n", 200)
  else:
    return make_response("Not healthy :(\n", 500)

if __name__ == '__main__':
  t1 = threading.Thread(target=start_rabbitMQ_consumer, args=[])
  t1.start()
  
  t2 = threading.Thread(target=start_scheduler, args=[])
  t2.start()

  schedule.every(120).seconds.do(retry_failed_payments)
  # schedule.every(120).minutes.do(retry_failed_payments)

  app.run(debug=False, use_reloader=False, port=PORT)