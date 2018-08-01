const router = require('express').Router()
const Joi = require('joi')
const schema = require('./schema')
const queries = require('./queries')

router.post('/', (req, res, next) => {
  const client = req.body
  Joi.validate(client, schema, (err, _) => {
    if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    else {
      queries().create(client, (err, _) => {
        if (err) {
          if (err.detail.indexOf('already exists') > -1) {
            return res.status(409)
              .json({ status: 'ERROR', msg: 'cliente já cadastrado.' })
          }

          next({ err })
        } else res.status(201).json({ status: 'OK', msg: 'Cliente criado com sucesso.' })
      })
    }
  })
})

router.get('/:id', (req, res, next) => {
  const id = req.params.id
  queries().byId(id, (err, response) => {
    if (err) next({ err })
    else res.json({ status: 'OK', data: response.rows[0] })
  })
})

router.put('/:id', (req, res, next) => {
  const id = req.params.id
  const client = req.body

  Joi.validate(client, schema, (err, _) => {
    if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    else {
      delete client['user_id']
      queries().update(client, { id }, (err, response) => {
        if (err) next({ err })
        else {
          if (response.rowCount > 0)
            res.json({ status: 'OK', msg: 'Cliente atualizado com sucesso.' })
          else
            res.status(404).json({ status: 'ERROR', msg: 'Cliente não encontrado.' })
        }
      })
    }
  })
})

module.exports = router
