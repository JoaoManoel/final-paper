import pycard
import uuid
from flask import Blueprint, make_response, request, jsonify, g
from src.credit_card.model import CreditCard
from src.credit_card.model import Address
from src.credit_card import queries

credit_card = Blueprint('credit_card', __name__)

@credit_card.route('/client/<int:client_id>', methods=["POST"])
def create(client_id):
	try:
		document = request.json
		credit_card = document['card']
		credit_card['client_id'] = client_id

		address = document['address']
	except:
		return make_response(jsonify({'status': 'ERROR', 'msg': 'São necessários dois objetos: card e address'}), 400)

	# checar se o schema está valido
	# ainda não checa se o cartao é valido
	err = CreditCard(credit_card).validate()

	if (len(err) > 0):
		return make_response(jsonify({'status': 'ERROR', 'msg': err}), 400)
	else:
		err = Address(address).validate()
		if (len(err) > 0):
			return make_response(jsonify({'status': 'ERROR', 'msg': err}), 400)
		else:  
			card = pycard.Card(
				number=credit_card['number'],
				month=credit_card['exp_month'],
				year=credit_card['exp_year'],
				cvc=credit_card['cvc']
			)

			if card.is_valid:
        #save address first and get the id
				address_id = queries.save('address', address, g.db)

				credit_card['id'] = "card_%s" % uuid.uuid4()
				credit_card['brand'] = card.brand
				credit_card['last4'] = credit_card['number'][-4:]
				credit_card['address_id'] = address_id
				queries.save('card', credit_card, g.db)

				g.db.commit()
				res, code = ({'status': 'OK', 'msg': 'Cartão adicionado.'}, 201)
			else:
				res, code = ({'status': 'ERROR', 'msg': 'Cartão inválido. Tente novamente'}, 400)
			
			return make_response(jsonify(res), code)


@credit_card.route('/<string:card_id>/client/<int:client_id>')
def find_by_id(client_id, card_id):
  row = queries.find_by_id(client_id, card_id, g.db)
  if row is not None:
    return make_response(jsonify(row), 200)
  else:
    return make_response(jsonify({'status': 'ERROR', 'msg': 'Cliente ou cartão não encontrado.'}), 404)

@credit_card.route('/client/<int:client_id>/all')
def list_all(client_id):
	rows = queries.list_all(client_id, g.db)
	if rows is None:
		rows = []
	return make_response(jsonify({'status': 'OK', 'data': rows}), 200)

@credit_card.route('<string:card_id>/client/<int:client_id>', methods=["PUT"])
def update(client_id, card_id):
	try:
		document = request.json
		credit_card = document['card']
		credit_card['client_id'] = client_id

		address = document['address']
	except:
		return make_response(jsonify({'status': 'ERROR', 'msg': 'São necessários dois objetos: card e address'}), 400)

	# checar se o schema está valido
	# ainda não checa se o cartao é valido
	err = CreditCard(credit_card).validate()

	if (len(err) > 0):
		return make_response(jsonify({'status': 'ERROR', 'msg': err}), 400)
	else:
		err = Address(address).validate()
	
		if (len(err) > 0):
			return make_response(jsonify({'status': 'ERROR', 'msg': err}), 400)
		else:
			card = pycard.Card(
				number=credit_card['number'],
				month=credit_card['exp_month'],
				year=credit_card['exp_year'],
				cvc=credit_card['cvc']
			)

			if card.is_valid:
				row = queries.find_address_by_card_id(card_id, g.db)
				if row is not None:
					queries.update_address(row['id'], address, g.db)
					queries.update_card(card_id, credit_card, g.db)

					g.db.commit()
					res, code = ({'status': 'OK', 'msg': 'Cartão atualizado.'}, 200)
				else:
					res, code = ({'status': 'ERROR', 'msg': 'Cliente ou cartão não encontrado.'}, 404)
			else:
				res, code = ({'status': 'ERROR', 'msg': 'Cartão inválido. Tente novamente'}, 400)

			return make_response(jsonify(res), code)

@credit_card.route('<string:card_id>/client/<int:client_id>', methods=["DELETE"])
def delete(client_id, card_id):
  is_success = queries.delete(client_id, card_id, g.db)
  
  if is_success:
  	return make_response(jsonify({'status': 'OK', 'msg': 'Cartão deletado com sucesso.'}), 200)
  else:
    return make_response(jsonify({'status': 'ERROR', 'msg': 'Cliente ou cartão não encontrado.'}), 404)
