const Joi = require('joi')

const schema = Joi.object().keys({
  name: Joi.string().min(2).max(255).required(),
  last_name: Joi.string().min(2).max(255).required(),
  birthday: Joi.date(),
  landline_number: Joi.string().min(3).max(50),
  cellphone_number: Joi.string().min(3).max(50),
  user_id: Joi.number().required()
})

module.exports = schema
