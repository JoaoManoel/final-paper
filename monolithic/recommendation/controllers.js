const router = require('express').Router()
const queries = require('./queries')

function checkId (id) {
  return /^[0-9]+$/.test(id) ? id : 0
}

router.get('/:sku', (req, res, next) => {
  const sku = req.params.sku
  console.log(sku)
  queries().getRecommendedProducts(sku, (err, response) => {
    if (err) next({ status: 500, err })
    else {
      res.json({ status: 'OK', recommended_products: response.rows })
    }
  })
})

router.put('/salesNumber/:sku', (req, res, next) => {
  const sku = checkId(req.params.sku)
  queries().updateSalesNumber(sku, (err, _) => {
    if (err) next({ status: 500, err })
    else {
      res.json({ status: 'OK', msg: 'Quantidade de vendas atualizada com sucesso.' })
    }
  })
})

router.post('/:categoryId/:sku', (req, res, next) => {
  const categoryId = checkId(req.params.categoryId)
  const sku = req.params.sku
  if (categoryId === 0) {
    return res.status(400).json({ status: 'ERROR', msg: 'Categoria.' })
  }

  queries().createRecommendation({ categoryId, sku }, (err, response) => {
    if (err) {
      if (err.detail.indexOf('already exists') > -1) {
        res.status(409).json({ status: 'ERROR', msg: 'Produto já existe na lista de recomendações' })
      } else next({ status: 500, err })
    } else {
      res.json({ status: 'OK', msg: 'Recomendação criada com sucesso.' })
    }
  })
})

module.exports = router
