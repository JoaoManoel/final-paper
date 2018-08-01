const Joi = require('joi')

const schema = Joi.object().keys({
  client_id: Joi.number().integer().required(),
  product_id: Joi.number().integer().required(),
  stars: Joi.string().regex(/^[0-9]+$/).required(),
  title: Joi.string().min(3).max(40),
  review_date: Joi.string(),
  comment: Joi.string().min(3)
})

module.exports = schema