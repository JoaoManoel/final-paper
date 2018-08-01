const router = require('express').Router()
const queries = require('./queries')
const reviewQueries = require('../review/queries')
const recommendationQueries = require('../recommendation/queries')

function seperateProductAndModels(rows) {
  const row = rows[0]

  let data = {
    'product': {
      id: row.id,
      name: row.name,
      description: row.description,
      category_id: row.category_id,
      detail: row.detail,
      price: row.price
    },
    models: []
  }

  rows.map(row => {
    let obj = {}
    Object.keys(row).map(k => {
      const _keyToCheck = 'model_'
      if (k.indexOf(_keyToCheck) > -1)
        obj[k.replace(_keyToCheck, '')] = row[k]
    })

    data.models.push(obj)
  })

  return data
}

router.get('/all', (_, res, next) => {
  queries().listAll((err, response) => {
    if (err) next({ status: 500, msg: err })
    else res.json({ status: 'OK', data: response.rows })
  })
})

router.get('/byGenre/:genre', (req, res, next) => {
  const genre = req.params['genre']

  queries().byGenre(genre, (err, response) => {
    if (err) {
      if (err.routine.indexOf('enum') > -1)
        return res.status(400).json({ status: 'ERROR', data: 'Gênero não encontrado.' })

      next({ status: 500, msg: err })
    } else res.json({ status: 'OK', data: response.rows })
  })
})

router.get('/:id/model', (req, res, next) => {
  const id = req.params.id
  queries().productModel(id, (err, response) => {
    if (err) next({ status: 500, msg: err })
    else {
      const rows = response.rows
      if (rows.length > 0) {
        const data = seperateProductAndModels(rows)

        res.json({ status: 'OK', data })
      } else res.status(404).json({ status: 'ERROR', msg: 'Produto não encontrado.' })
    }
  })
})

// Will gather some queries in one response
// Product Models
// Product Inventory
// Product Reviews
// Product Recommendation
router.get('/:id/details', (req, res, next) => {
  const productId = req.params.id
  
  // Callback Hell :-(
  queries().productModelWithQuantity(productId, (err, response) => {
    if (err) next({ status: 500, msg: err })
    else {
      const rows = response.rows
      if (rows.length > 0) {
        let data = seperateProductAndModels(rows)
        reviewQueries().findReviewByProductId({ productId, quantity: 10, page: 1 }, (err, { rows }) => {
          if (err) next({ status: 500, msg: err })
          else {
            data['reviews'] = rows
            reviewQueries().getStarAvgAndStarsCountByProductId(productId, (err, { rows }) => {
              if (err) next({ status: 500, msg: err })
              else {
                data['avgAndCountStars'] = rows[0]
                recommendationQueries().getRecommendedProductsByCategory(data.product.category_id, data.product.id, (err, { rows }) => {
                  if (err) next({ status: 500, msg: err })
                  else {
                    data['recommended_products'] = rows
                    res.json({ status: 'OK', data })
                  }
                })
              }
            })
          }
        })

      } else res.status(404).json({ status: 'ERROR', msg: 'Produto não encontrado.' })
    }
  })
})

module.exports = router
