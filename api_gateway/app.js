const app = require('express')()
const morgan = require('morgan')
const bodyParser = require('body-parser')
const helmet = require('helmet')
const cors = require('cors')
const proxy = require('express-http-proxy')
const { servicesConfiguration } = require('./config')

const PORT = process.env.PORT || 3000

app.use(cors())
app.use(helmet())
app.use(bodyParser.json())
app.use(morgan('common'))

// Define proxys
Object.values(servicesConfiguration).map(config => {
  Object.keys(config.services).map(service => {
    console.log(`${config.path}/${service}/* >>>>>>>> ${config.services[service].host}${config.path}/${service}`)
    app.all(`${config.path}/${service}/*`, proxy(`${config.services[service].host}${config.path}/${service}`))
  })
})

app.get('/ping', (_, res) => { res.json({ msg: 'pong' }) })

app.use('/api/v1/store', require('./store'))

// app.all('/api/v1/category/*', proxy('http://127.0.0.1:2003/api/v1/category'))

const server = app.listen(PORT, () => {
  console.log(`API Gateway Up and Running on port: ${PORT}`)
})

// Erro...
app.use((err, req, res, next) => {
  console.info(`Horário: ${new Date().toISOString()}`)
  console.error(err)
  return res.status(err.status ? err.status : 500).json({ status: 'ERROR', msg: err.msg ? err.msg : 'Algo inesperado aconteceu...' })
})

// Não encontrado...
app.use((req, res, next) => {
  res.status(404).json({ status: 'ERROR', msg: `D'oh!` })
})

function shutdown () {
  server.close((err) => {
    if (err) {
      console.error(err)
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
  console.info(`\nGot SIGTERM. Graceful shutdown ${new Date().toISOString()}`)
  shutdown()
})
