const router = require('express').Router()
const queries = require('./queries')

function checkId (id) {
  return /^[0-9]+$/.test(id) ? id : 0
}

router.post('/:categoryId/:productId/:sku', (req, res, next) => {
  const categoryId = checkId(req.params.categoryId)
  const productId = req.params.productId
  const sku = req.params.sku
  
  if (categoryId === 0) {
    return res.status(404).json({ status: 'ERROR', msg: 'Categoria não existe.' })
  }

  queries().createRecommendation({ categoryId, productId, sku }, (err, _) => {
    if (err) {
      if (err.detail.indexOf('already exists') > -1) {
        res.status(409).json({ status: 'ERROR', msg: 'Produto já existe na lista de recomendações' })
      } else next({ status: 500, err })
    } else {
      res.json({ status: 'OK', msg: 'Recomendação criada com sucesso.' })
    }
  })
})

router.get('/:sku', (req, res, next) => {
  const sku = req.params.sku
  queries().getRecommendedProducts(sku, (err, response) => {
    if (err) next({ status: 500, err })
    else {
      res.json({ status: 'OK', recommended_products: response.rows })
    }
  })
})

router.get('/:categoryId/:productId', (req, res, next) => {
  const categoryId = checkId(req.params.categoryId)
  const productId = checkId(req.params.productId)

  if (categoryId === 0 || productId === 0)
    return res.status(404).json({ status: 'ERROR', msg: 'Categoria ou produto não encontrado.' })

  queries().getRecommendedProductsByCategory(categoryId, productId, (err, response) => {
    if (err) next({ status: 500, err })
    else {
      res.json({ status: 'OK', recommended_products: response.rows })
    }
  })
})

router.put('/salesNumber/:sku', (req, res, next) => {
  const sku = req.params.sku
<<<<<<< HEAD
  queries().updateSalesNumber(sku, (err, _) => {
    if (err) next({ status: 500, err })
    else {
      res.json({ status: 'OK', msg: 'Quantidade de vendas atualizada com sucesso.' })
=======
  if (categoryId === 0) {
    return res.status(404).json({ status: 'ERROR', msg: 'Categoria Não existe.' })
  }

  queries().createRecommendation({ categoryId, sku }, (err, _) => {
    if (err) {
      if (err.detail.indexOf('already exists') > -1) {
        res.status(409).json({ status: 'ERROR', msg: 'Produto já existe na lista de recomendações' })
      } else next({ status: 500, err })
    } else {
      res.json({ status: 'OK', msg: 'Recomendação criada com sucesso.' })
>>>>>>> 79d2bcb7dd5bca6e071bcc0a52dfe1702987e654
    }
  })
})

module.exports = router
