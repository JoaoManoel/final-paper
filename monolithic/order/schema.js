const Joi = require('joi')

const productSchema = Joi.object().keys({
  name: Joi.string().required(),
  description: Joi.string().required(),
  detail: Joi.string(),
  price: Joi.number().required(),
  weight: Joi.number(),
  category: Joi.object().keys({
    id: Joi.number().required(),
    name: Joi.string().required(),
    gender: Joi.string().required()
  }),
  model: Joi.object().keys({
    id: Joi.number().required(),
    sku: Joi.string().required(),
    quantity: Joi.number().required(),
    size: Joi.string().required(),
    color: Joi.string().required()
  })
})

const clientSchema = Joi.object().keys({
  id: Joi.number().required(),
  name: Joi.string().required(),
  email: Joi.string().required(),
  last_name: Joi.string().required(),
  birthday: Joi.string(),
  landline_number: Joi.string(),
  cellphone_number: Joi.string(),
  user_id: Joi.number().required()
})

const addressSchema = Joi.object().keys({
  id: Joi.number().required(),
  address_name: Joi.string().required(),
  responsible_name: Joi.string(),
  address_phone: Joi.string(),
  city: Joi.string().required(),
  zipcode: Joi.string().required(),
  address: Joi.string().required(),
  state: Joi.string().required()
})

const cardSchema = Joi.object().keys({
  id: Joi.string().required(),
  cvc: Joi.string().required()
})

const schema = Joi.object().keys({
  date: Joi.string(),
  status: Joi.string(),
  amount: Joi.number().required(),
  products: Joi.array().min(1).items(productSchema).required(),
  client: clientSchema.required(),
  address: addressSchema.required(),
  card: cardSchema.required()
})

module.exports = schema