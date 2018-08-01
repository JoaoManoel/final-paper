const Joi = require('joi')

const schema = Joi.object().keys({
  id: Joi.number(),
  stock_total: Joi.number().required(),
  stock_reserved: Joi.number(),
  sku: Joi.string().required()
})

module.exports = schema