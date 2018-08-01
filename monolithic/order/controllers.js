const router = require('express').Router()
const Joi = require('joi')
const uuidv4 = require('uuid/v4')
const ObjectID = require('mongodb').ObjectID;

const schema = require('./schema')
const mongo = require('../mongo')
const { email } = require('../helpers')
const inventoryQueries = require('../inventory/queries')
const recommendationQueries = require('../recommendation/queries')
const chargeQueries = require('../charge/queries')
const chargeController = require('../charge/controllers')

router.get('/:client_id/all', (req, res, next) => {
  const clientID = req.params.client_id
  if (/^[0-9]+$/.test(clientID)) {
    mongo().connect((err, response) => {  
      if (err) next({ status: 500, err })
      else {
        const { client, db } = response
        db.collection('orders').find({ 'client.id': parseInt(clientID) }).toArray((err, orders) => {
          if (err) next({ status: 500, err })
          else res.json({ status: 'OK', orders })
  
          client.close()
        })
      }
    })
  } else res.status(404).json({ status: 'ERROR', msg: 'ID inválido!'})

})

router.get('/:order_id', (req, res, next) => {
  const orderID = req.params.order_id
  const isValidOrderID = ObjectID.isValid(orderID)
  if (isValidOrderID) {
    mongo().connect((err, response) => {  
      if (err) next({ status: 500, err })
      else {
        const { client, db } = response
        db.collection('orders').findOne({ '_id': ObjectID(orderID) }, (err, order) => {  
          if (err) next({ status: 500, err })
          else res.json({ status: 'OK', order: order ? order : {} })
  
          client.close()
        })
      }
    })
  } else res.status(404).json({ status: 'OK', msg: 'ID inválido!' })
})

router.post('/', (req, res, next) => {
  const order = req.body
  Joi.validate(order, schema, (err, _) => {
    if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    else {
      mongo().connect((err, { client, db }) => {
        if (err) next({ status: 500, err })
        else {
          db.collection('orders').insertOne({ order, status: 'processing' }, (err, result) => {
            if (err) next({ status: 500, err })
            else {
              client.close()

              // send email
              email().sendOrderEmail({
                email: order.client.email,
                subject: 'Novo Pedido!',
                order_id: result.insertedId,
                status: 'PROCESSANDO'
              }, () => {
                // update every product inventory and recommendation
                order.products.map(product => {
                  const sku = product.model.sku

                  // pode deixar falhar...
                  inventoryQueries().update({
                    sku,
                    status: 'processing',
                    quantity: product.model.quantity
                  }, (err) => {
                    if (err) console.log(err)
                    else {
                      console.log(`Inventário ${sku} atualizado!`) 
                      recommendationQueries().updateSalesNumber(sku, (err) => { 
                        if (err) console.log(err)
                        else console.log(`Recomendação ${sku} atualizada!`) 
                      })
                    }
                  })
                })

                // first charge try
                chargeController().simulatePayment().then((is_paid) => {
                  chargeQueries().create({
                    id: `charge_${uuidv4()}`,
                    amount: parseFloat(order.amount),
                    paid: is_paid,
                    payment_id: order.card.id,
                    client_id: order.client.id,
                    order_id: result.insertedId
                  }, (err) => { 
                    if (err) return next({ status: 500, err })
                    else console.log('Cobrança criada!') 
                  })

                  if (is_paid) {
                    mongo().connect((err, { client, db }) => {
                      if (err) return next({ status: 500, err })
                      else {
                        db.collection('orders').findOne({ '_id': ObjectID(result.insertedId) }, () => {
                          // set STATUS confirmed/canceled
                          db.collection('orders').update(
                            { '_id': ObjectID(result.insertedId) }, 
                            { $set: { status: 'confirmed' }}, (err) => {
                              client.close()

                              if (err) return next({ status: 500, err })
                              else {
                                chargeController().updateInventoryAndSendEmail({
                                  products: order.products,
                                  email: order.client.email,
                                  order_id: result.insertedId,
                                  status: 'confirmed',
                                  statusToEmail: 'Confirmado' 
                                })
                              }
                          })
                        })
                      }
                    })
                  }
                  
                  res.json({ status: 'OK', msg: 'Pedido realizado com sucesso.' })
                })
              })
            }            
          })
        }
      })
    }
  })
})

module.exports = router