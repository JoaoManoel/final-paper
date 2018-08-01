const ObjectID = require('mongodb').ObjectID;

const mongo = require('../mongo')
const { email } = require('../helpers')
const inventoryQueries = require('../inventory/queries')

function updateProducts (products, status) {
  products.map(product => {
    inventoryQueries().update({
      sku: product.model.sku,
      quantity: product.model.quantity,
      status,
    }, () => { console.log(`Inventário ${product.model.sku} atualizado!`)})
  })
}

function sendEmail (params) {
  // send email
  email().sendOrderEmail({
    email: params.email,
    subject: 'Atualização do Pedido!',
    order_id: params.order_id,
    status: params.statusToEmail
  }, () => { console.log('Email enviado!') })
}

module.exports = () => {
  return {
    simulatePayment: () => {
      return new Promise((resolve, _) => {
        setTimeout(() => {
          resolve((Math.random() * 100) < 80)
        }, 10 * 1000)
      })
    },
    updateInventoryAndSendEmail: (params) => {
      if (params.products) {
        updateProducts(params.products, params.status)
        sendEmail(params)
      } else {
        mongo().connect((err, response) => {  
          if (err) console.error(err)
          else {
            const { client, db } = response
            const orderID = params.order_id.replace(/["']+/g, "")

            db.collection('orders').findOne({ '_id': ObjectID(orderID) }, (_, result) => {
              params.email = result.order.client.email
              // set STATUS confirmed/canceled
              db.collection('orders').update(
                { '_id': ObjectID(orderID) }, 
                { $set: { status: params.status }
              })

              updateProducts(result.order.products, params.status)
              sendEmail(params)

              client.close()
            })
          }
        })
      }
    }
  }
}