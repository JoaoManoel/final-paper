const Joi = require('joi')

const clientSchema = Joi.object().keys({
  name: Joi.string().min(2).max(255).required(),
  last_name: Joi.string().min(2).max(255).required(),
  birthday: Joi.date(),
  landline_number: Joi.string().min(3).max(50),
  cellphone_number: Joi.string().min(3).max(50),
  user_id: Joi.number().required()
})

const creditcardSchema = Joi.object().keys({
  id: Joi.number(),
  number: Joi.string().creditCard().required(),
  exp_month: Joi.number().min(1).max(12).required(),
  exp_year: Joi.number().min(2018).max(9999).required(),
  cvc: Joi.string().min(3).max(4).required(),
  name: Joi.string().max(50).required(),
  address_id: Joi.number()
})

module.exports = { clientSchema, creditcardSchema }
