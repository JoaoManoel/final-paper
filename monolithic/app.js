const app = require('express')()
const morgan = require('morgan')
const bodyParser = require('body-parser')
const schedule = require('node-schedule')
const compression = require('compression')

const db = require('./db')

const chargeController = require('./charge')
const chargeQueries = require('./charge/queries')

const port = process.env.PORT || 8366

const server = app.listen(port, () => {
  console.log(`Up and running on port: ${port}`)
})

app.use(morgan('common'))
app.use(bodyParser.json())
app.use(compression())

app.get('/health', (_, res) => {
  db().query('SELECT 1+1', [], (err, _) => {
    if (err) res.status(500).send(`Not healty :(\n`)
    else res.status(200).send(`Healty :D\n`)
  })
})

app.use('/api/v1/', require('./api_v1'))

app.use((err, req, res, next) => {
  console.log(`Horário: ${new Date().toISOString()}`)
  console.error(err)

  return res.status(err.status ? err.status : 500).json({ status: 'ERROR', msg: 'Algo inesperado aconteceu.' })
})

app.use((req, res, next) => {
  res.status(404).json({ status: 'ERROR', msg: `D'oh!` })
})

schedule.scheduleJob('*/2 * * * *', () => {
  console.log('Charges Schedule Fired!!!')
  chargeQueries().findFailedCharges((err, results) => {
    results.rows.map((charge) => {
      chargeController().simulatePayment().then((is_paid) => {
        let attempts = charge.attempts + 1
        if (is_paid) {
          chargeController().updateInventoryAndSendEmail({
            order_id: charge.order_id,
            status: 'confirmed',
            statusToEmail: 'CONFIRMADO' 
          })
        }

        // falhou
        if (!is_paid && attempts === 4) {
          chargeController().updateInventoryAndSendEmail({
            order_id: charge.order_id,
            status: 'canceled',
            statusToEmail: 'Cancelado' 
          })
        }

        chargeQueries().update({
          is_paid,
          attempts: charge.attempts + 1,
          charge_id: charge.charge_id
        }, () => { console.log('Cobrança realizada!') })
      })
    })
  })
})

function shutdown() {
  server.close(err => {
    if (err) {
      console.log(err)
      process.exitCode = 1
    }

    process.exit()
  })
}

process.on('SIGINT', () => {
  console.info(`\nGot SIGINT. Graceful shutdown ${new Date().toISOString()}`)
  shutdown()
})

process.on('SIGTERM', () => {
  console.log(`\nGOT SIGTERM. Graceful shutdown ${new Date().toISOString()}`)
  shutdown()
})
