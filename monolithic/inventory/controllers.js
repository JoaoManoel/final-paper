const router = require('express').Router()
const Joi = require('joi')
const schema = require('./schema')
const queries = require('./queries')

router.post('/', (req, res, next) => {
  const inventory = req.body
  Joi.validate(inventory, schema, err => {
    if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    else {
      queries().create(inventory, (err, _) => {
        if (err) {
          if (err.detail.indexOf('already exists') > -1) {
            return res.status(409)
              .json({ status: 'ERROR', msg: 'inventário já cadastrado.' })
          }

          if (err.detail.indexOf('not present in table "model"') > -1) {
            return res.status(404)
              .json({ status: 'ERROR', msg: 'Nenhum produto cadastrado com o SKU informado.' })
          }

          next({ err })
        } else res.status(201).json({ status: 'OK', msg: 'Inventário criado com sucesso.' })
      })
    }
  })
})

router.get('/all', (_, res, next) => {
  queries().listAll((err, response) => {
    if (err) next({ status: 500, msg: err.detail })
    else res.json({ status: 'OK', data: response.rows })
  })
})

router.get('/bySKU/:sku', (req, res, next) => {
  const sku = req.params.sku
  queries().findBySKU(sku, (err, response) => {
    if (err) next({ status: 500, msg: err.detail })
    else res.json({ status: 'OK', data: response.rows[0] })
  })
})

router.put('/processing/:sku', (req, res, next) => {
  const sku = req.params.sku
  const quantity = req.body.quantity

  if (/^[0-9]+$/.test(quantity)) {
    queries().update({ sku, status: 'processing', quantity }, (err, _) => {
      if (err) {
        if (err.detail) {
          res.status(400).json({ status: 'ERROR', msg: err.detail })
        } else next({ status: 500, msg: err })
      } else res.json({ status: 'OK', msg: 'Inventário atualizado com sucesso.' })
    })
  } else res.status(402).json({ status: 'ERROR', msg: 'Quantidade deve ser um número.' })
})

router.put('/confirmed/:sku', (req, res, next) => {
  const sku = req.params.sku
  const quantity = req.body.quantity

  if (/^[0-9]+$/.test(quantity)) {
    queries().update({ sku, status: 'confirmed', quantity }, (err, _) => {
      if (err) {
        if (err.detail) {
          res.status(400).json({ status: 'ERROR', msg: err.detail })
        } else next({ status: 500, msg: err })
      } else res.json({ status: 'OK', msg: 'Inventário atualizado com sucesso.' })
    })
  } else res.status(402).json({ status: 'ERROR', msg: 'Quantidade deve ser um número.' })
})

router.put('/canceled/:sku', (req, res, next) => {
  const sku = req.params.sku
  const quantity = req.body.quantity

  if (/^[0-9]+$/.test(quantity)) {
    queries().update({ sku, status: 'canceled', quantity }, (err, _) => {
      if (err) {
        if (err.detail) {
          res.status(400).json({ status: 'ERROR', msg: err.detail })
        } else next({ status: 500, msg: err })
      } else res.json({ status: 'OK', msg: 'Inventário atualizado com sucesso.' })
    })
  } else res.status(402).json({ status: 'ERROR', msg: 'Quantidade deve ser um número.' })

})

router.delete('/:id', (req, res, _) => {
  queries().delete(req.params.id, (_, response) => {
    if (response.rowCount > 0) 
      res.json({ status: 'OK', msg: 'Inventário deletado com sucesso.' })
    else 
      res.status(404).json({ status: 'ERROR', msg: 'Inventário não encontrado.' })
  })
})

module.exports = router