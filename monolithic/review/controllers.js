const router = require('express').Router()
const Joi = require('joi')

const queries = require('./queries')
const schema = require('./schema')

router.get('/:productId', async (req, res, next) => {
  const isNumber = /^[0-9]+$/
  const productId = req.params.productId
  let page = req.query.page
  let quantity = req.query.quantity

  page = isNumber.test(page) ? parseInt(page) : 1
  quantity = isNumber.test(quantity) ? parseInt(quantity) : 5

  queries().findReviewByProductId({productId, page, quantity}, (err, response) => {
    if (err) next({ status: 500, msg: err })
    else {
      queries().getStarAvgAndStarsCountByProductId(productId, (err, avgAndCountStarsResponse) => {
        if (err) next({ status: 500, msg: err })
        else {
          res.json({ status: 'OK', review: response.rows, avgAndCountStars: avgAndCountStarsResponse.rows[0] })
        }
      })
    }
  })    
})

router.post('/', (req, res, next) => {
  req.body['review_date'] = 'now()'

  Joi.validate(req.body, schema, (err, value) => {
    if (err) next({ status: 400, msg: err.details[0].message })
    else {
      queries().createNewReview(value, (err, _) => {
        if (err) next({ status: 500 })
        else res.json({ status: 'OK', msg: 'Review adicionado com sucesso.' })
      })
    }
  })
})

module.exports = router