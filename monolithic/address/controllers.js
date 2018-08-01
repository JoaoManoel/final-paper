const router = require('express').Router()
const Joi = require('joi')
const schema = require('./schema')
const queries = require('./queries')

router.post('/', (req, res, next) => {
  const address = req.body
  Joi.validate(address, schema, (err, _) => {
    if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    else {
      queries().create(address, (err, _) => {
        if (err) {
          if (err.detail.indexOf('is not present') > -1) {
            res.status(404).json({ status: 'OK', msg: 'Cliente não encontrado.' })
          }
          next({ err })
        } else res.status(201).json({ status: 'OK', msg: 'Endereço criado com sucesso.' })
      })
    }
  })
})

router.get('/:id', (req, res, next) => {
  const id = req.params.id
  queries().byId(id, (err, response) => {
    if (err) next({ err })
    else {
      if (response.rowCount > 0)
        res.json({ status: 'OK', data: response.rows[0] })
      else
        res.status(404).json({ status: 'ERROR', msg: 'Endereço não encontrado.' })
    }
  })
})

router.put('/:id', (req, res, _) => {
  const id = req.params.id
  const address = req.body
  Joi.validate(address, schema, (err, _) => {
    if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    else {
      delete address['client_id']
      queries().update(address, { id }, (_, response) => {
        if (response.rowCount > 0)
          res.json({ status: 'OK', msg: 'Endereço atualizado com sucesso.' })
        else
          res.status(404).json({ status: 'ERROR', msg: 'Endereço não encontrado.' })
      })
    }
  })
})

router.delete('/:id', (req, res) => {
  const id = req.params.id
  queries().delete(id, (_, response) => {
    if (response.rowCount > 0)
      res.json({ status: 'OK', msg: 'Endereço removido com sucesso.' })
    else
      res.status(404).json({ status: 'ERROR', msg: 'Endereço não encontrado.' })
  })
})

module.exports = router
