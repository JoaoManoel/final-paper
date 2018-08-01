const app = require('express')()
const morgan = require('morgan')
const bodyParser = require('body-parser')
const db = require('./db')

const { port } = require('./config')

app.use(morgan('common'))
app.use(bodyParser.json())

const server = app.listen(port, () => {
  console.log(`Up and Running on PORT: ${port}`)
})

app.get('/health', (req, res) => {
  db().query('SELECT 1=1', [], (err, response) => {
    if (err) {
      console.error(err)
      return res.status(500).send(`I'm not healthy :( \n`)
    } else res.send(`I'm happy and healthy :)\n`)
  })
})

app.use('/api/v1', require('./api_v1'))

// Erro...
app.use((err, req, res, next) => {
  err.msg ? err.msg : 'Algo inesperado aconteceu...'
  console.info(`Horário: ${new Date().toISOString()}`)
  console.error(err)
  return res.status(err.status ? err.status : 500).json({ status: 'ERROR', msg: err.msg })
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
