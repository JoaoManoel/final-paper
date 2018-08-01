const app = require('express')()
const morgan = require('morgan')
const db = require('./db')

const port = process.env.PORT || 2003
// const isProduction = process.env.NODE_ENV === 'production'
app.use(morgan('common'))

const server = app.listen(port, () => {
  console.log(`Up and running on port: ${port}`)
})

app.get('/health', (req, res) => {
  db().query('SELECT 1=1', [], (err, response) => {
    if (err) {
      console.error(err)
      res.status(500).send(`I'm not healthy :( \n`)
    }
    else res.send(`I'm happy and healthy :)\n`)
  })
})

app.use('/api/v1', require('./api_v1'))

// se tiver erro
app.use((err, req, res, next) => {
  console.info(`Horário: ${new Date().toISOString()}`)
  console.error(err)

  return res.status(err.status ? err.status : 500).json({ status: 'ERROR', msg: 'Algo inesperado aconteceu.'})
})

// não encontrado...
app.use((req, res, next) => {
  res.status(404).json({ status: 'ERROR', msg: `D'oh!` })
})

function shutdown () {
  server.close(err => {
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
  console.info(`\nGOT SIGTERM. Graceful shutdown ${new Date().toISOString()}`)
  shutdown()
})
