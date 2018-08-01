const Joi = require('joi')
const schema = Joi.object().keys({
  responsible_name: Joi.string().min(3).max(255),
  address_phone: Joi.string().min(3).max(50),
  address_name: Joi.string().min(3).max(255).required(),
  zipcode: Joi.string().min(3).max(50).required(),
  address: Joi.string().min(3).max(255).required(),
  state: Joi.string().min(1).max(255).required(),
  city: Joi.string().min(3).max(255).required(),
  client_id: Joi.number().required(),
})

module.exports = schema

