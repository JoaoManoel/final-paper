from cerberus import Validator

class Address(object):
  def __init__(self, document):
    schema = {
      'address_name': {'type': 'string', 'maxlength': 255, 'required': True},
      'zipcode': {'type': 'string', 'maxlength': 50, 'required': True},
      'state': {'type': 'string', 'maxlength': 255, 'required': True},
      'city': {'type': 'string', 'maxlength': 255, 'required': True},
      'address': {'type': 'string', 'maxlength': 255, 'required': True},
      'address_phone': {'type': 'string', 'maxlength': 50},
      'responsible_name': {'type': 'string', 'maxlength': 255}
    }

    self.document = document
    self.v = Validator(schema, allow_unknown=False)

  def validate(self):
    return {} if self.v.validate(self.document) else self.v.errors

class CreditCard(object):
  def __init__(self, document):
    schema = {
      'id': {'type': 'string', 'maxlength': 100},
      'number': {'type': 'string', 'minlength': 16, 'maxlength': 16, 'required': True},
      'exp_month': {'type': 'integer', 'max': 12, 'required': True},
      'exp_year': {'type': 'integer', 'max': 9999, 'required': True},
      'cvc': {'type': 'string', 'minlength': 3, 'maxlength': 4, 'required': True},
      'name': {'type': 'string', 'maxlength': 100},
      'client_id': {'type': 'integer', 'required': True}
    }

    self.document = document
    self.v = Validator(schema, allow_unknown=False)

  def validate(self):
    return {} if self.v.validate(self.document) else self.v.errors