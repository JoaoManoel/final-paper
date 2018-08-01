const app = require('express')()
const morgan = require('morgan')
const bodyParser = require('body-parser')
const db = require('./db')

const port = process.env.PORT || 2450

const server = app.listen(port, () => {
  console.log(`Up and running on port: ${port}`)
})

app.use(morgan('common'))
app.use(bodyParser.json())

app.get('/health', (_, res) => {
  db().query('SELECT 1+1', [], (err, _) => {
    if (err) {
      console.error(err)
      res.status(500).send(`Not healty :(\n`)
    } else res.status(200).send(`Healty :D\n`)
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

function shutdown () {
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
