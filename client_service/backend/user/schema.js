const Joi = require('joi')

const schema = Joi.object().keys({
  email: Joi.string().email().required(),
  password: Joi.string().max(255).required()
})

module.exports = schema
