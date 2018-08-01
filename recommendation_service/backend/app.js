const app = require('express')()
const morgan = require('morgan')
const amqp = require('amqplib/callback_api')

const db = require('./db')
const queries = require('./recommendation/queries')
const { port, rabbitMQ } = require('./config')

app.use(morgan('common'))

app.get('/health', (_, res) => {
  db().query('SELECT 1=1', [], (err, _) => {
    if (err) {
      console.error(err)
      res.status(500).send(`I'm not healthy :(\n`)
    } else res.status(200).send(`I'm happy and healthy :-)\n`)
  })
})

app.use('/api/v1', require('./api_v1'))

app.use((req, res, next) => {
  res.status(404).json({ status: 'ERROR', msg: `D'oh!` })
})

app.use((err, req, res, next) => {
  const msg = err.msg || 'Algo inesperado aconteceu.'
  const status = err.status || 500

  console.info(`Horário: ${new Date().toISOString()}`)
  console.error(err)
  return res.status(status).json({ status: 'ERROR', msg })
})

amqp.connect(`amqp://${rabbitMQ.user}:${rabbitMQ.password}@${rabbitMQ.service}`, (err, conn) => {
  const exName = 'order_ex'
  const queueName = 'order-recommendation'
  const routingKey = 'order.update.recommendation'
  // rabbitmqConnection = conn

  if (!err) {
    conn.createChannel((_, ch) => {
      ch.assertExchange(exName, 'topic', {durable: true})

      ch.assertQueue(queueName, { durable: true }, (_, q) => {
        console.log(' * Started to consume...')
        ch.bindQueue(q.queue, exName, routingKey)

        ch.consume(q.queue, msg => {
          const order = JSON.parse(msg.content.toString())
          const products = order.products
          products.map((product, index) => {
            queries().updateSalesNumber(product.model.sku, (err, _) => {
              if (!err) {
                console.log('Product recommendation updated!')
                if (index === products.length - 1) { ch.ack(msg) }
              }
            })
          })
        }, { noAck: false })
      })
    })
  } else {
    console.error(`RabbitMQ Error: \n${err}`)
    process.exit(1)
  }
})

const server = app.listen(port, () => {
  console.log(`Server up and running on port: ${port}`)
})

function shutdown () {
  // rabbitmqConnection.close()
  server.close(err => {
    if (err) {
      console.error(err)
      process.exitCode = 1
    }
    process.exit()
  })
}

process.on('SIGINT', () => {
  console.log(`\nGot SIGINT. Graceful shutdown ${new Date().toISOString()}`)
  shutdown()
})

process.on('SIGTERM', () => {
  console.log(`\nGot SIGTERM. Graceful shutdown ${new Date().toISOString()}`)
  shutdown()
})
