const router = require('express').Router()
const queries = require('./queries')
const _ = require('lodash')

router.get('/all', (_, res, next) => {
  queries().listAll((err, response) => {
    if (err) next({ status: 500, msg: err })
    else res.json({ status: 'OK', data: response.rows })
  })
})

router.get('/byGenre', (_, res, next) => {
  queries().listAll((err, response) => {
    if (err) next({ status: 500, msg: err })
    else res.json({ status: 'OK', data: _.groupBy(response.rows, 'gender') })
  })
})

module.exports = router
