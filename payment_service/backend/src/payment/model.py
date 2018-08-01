from cerberus import Validator

class Payment(object):
  def __init__(self, document):
    schema = {
      'payment_id': {'type': 'string', 'required': True},
      'client_id': {'type': 'integer', 'required': True},
      'order_id': {'type': 'string', 'required': True},
      'amount': {'type': 'float', 'required': True},
      'cvc': {'type': 'string', 'minlength': 3, 'maxlength': 4, 'required': True},
    }

    self.document = document
    self.v = Validator(schema, allow_unknown=False)

  def validate(self):
    return {} if self.v.validate(self.document) else self.v.errors