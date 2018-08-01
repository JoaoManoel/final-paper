const router = require('express').Router()
const Joi = require('joi')
const uuidv4 = require('uuid/v4')

const { clientSchema, creditcardSchema } = require('./schema')
const addressSchema = require('../address/schema')

const queries = require('./queries')
const addressQueries = require('../address/queries')

router.post('/', (req, res, next) => {
  const client = req.body
  Joi.validate(client, clientSchema, (err, _) => {
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

  Joi.validate(client, clientSchema, (err, _) => {
    if (err) res.status(409).json({ status: 'ERROR', msg: err.details[0].message })
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

// Credit Card
router.post('/:id/card', (req, res, next) => {
  const card = req.body.card
  const address = req.body.address
  
  Joi.validate(card, creditcardSchema, (err, _) => {
    card['client_id'] = req.params.id
    card['id'] = `card_${uuidv4()}`
    card['brand'] = 'visa'
    card['last4'] = card.number.slice(-4)
    
    if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    else {
      if (card.address_id) {
        queries().createCC(card, (err, _) => {
          if (err) {
            const detail = err.detail
            if (detail.indexOf('is not present in table "address"') > -1) {
              res.status(404).json({ status: 'ERROR', msg: 'Endereço não cadastrado.' })
            }

            if (detail.indexOf('is not present in table "client"') > -1) {
              res.status(404).json({ status: 'ERROR', msg: 'Cliente não cadastrado.' })
            }
          } else res.json({ stataus: 'OK', msg: 'Cartão de crédito criado com sucesso.' })
        })
      } else {
        address['client_id'] = req.params.id
        Joi.validate(address, addressSchema, (err) => {
          if (err) res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
          else {
            addressQueries().create(address, (err, response) => {
              if (err) {
                if (err.detail.indexOf('is not present in table "client"') > -1) {
                  res.status(404).json({ status: 'ERROR', msg: 'Cliente não cadastrado.' })
                }
              } else {
                const newAddressID = response.rows[0].id
                card['address_id'] = newAddressID

                queries().createCC(card, () => {
                  res.status(201).json({ status: 'OK', msg: 'Cartão de Crédito criado com sucesso.' })
                })
              }
            })
          }
        })
      }
    }
  })
})

router.get('/:id/card/:card_id', (req, res, next) => {
  const card_id = req.params.card_id
  queries().findCCById(card_id, (_, response) => {
    if (response.rows.length > 0)
      res.json({ status: 'OK', data: response.rows[0] })
    else
      res.status(404).json({ status: 'ERROR', msg: 'Cartão ou cliente não encontrado.' })
  })
})

router.get('/:id/cards', (req, res, next) => {
  const client_id = req.params.id
  queries().findAllCCByClient(client_id, (_, response) => {
    if (response.rows.length > 0)
      res.json({ status: 'OK', data: response.rows })
    else
      res.status(404).json({ status: 'ERROR', msg: 'Cliente não encontrado.' })
  })
})

router.delete('/:id/card/:card_id', (req, res, next) => {
  const card_id = req.params.card_id
  queries().deleteCC(card_id, (_, response) => {
    if (response.rowCount > 0)
      res.json({ status: 'OK', msg: 'Cartão deletado com sucesso.' })
    else
      res.status(404).json({ status: 'ERROR', msg: 'Cartão não encontrado.' })
  })
})


module.exports = router
