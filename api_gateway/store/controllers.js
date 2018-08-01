const router = require('express').Router()
const axios = require('axios')
const { servicesConfiguration } = require('../config')

const apiV1Services = servicesConfiguration['v1'].services

router.get('/product/:productId/details', (req, res) => {
  const productId = req.params.productId
  let productObj = {}

  const productURL = `${apiV1Services.product.host}/api/v1/product/${productId}/model`
  const productBySkuURL = `${apiV1Services.product.host}/api/v1/product/bySKU`
  const inventoryURL = `${apiV1Services.inventory.host}/api/v1/inventory/bySKU`
  const reviewURL = `${apiV1Services.review.host}/api/v1/review/${productId}`
  const recommendationURL = `${apiV1Services.recommendation.host}/api/v1/recommendation`

  axios.get(productURL).then(({ data }) => {
    let promises = []
    productObj = data.data
    productObj.models.map(model => {
      promises.push(
        axios.get(`${inventoryURL}/${model.sku}`)
      )
    })

    Promise
      .all(promises)
      .then(values => {
        values.map(({ data }, index) => {
          productObj.models[index]['stock_total'] = data.data['stock_total']
        })

        axios.get(`${reviewURL}`)
          .then(({ data }) => {
            productObj['review'] = data.review
            productObj['avgAndCountStars'] = data.avgAndCountStars
            let promises = []

            axios
              .get(`${recommendationURL}/${productObj.product.category_id}/${productObj.product.id}`)
              .then(({ data}) => {
                data.recommended_products.map(rec_prod => {
                  promises.push(axios.get(`${productBySkuURL}/${rec_prod.sku}`))
                })

                Promise
                .all(promises)
                .then((values) => {
                  let recommended_products = []
                  values.map(({ data }) => {
                    recommended_products.push(data.data[0])
                  })
                  productObj['recommended_products'] = recommended_products

                  res.json({ status: 'OK', data: productObj })
                }).catch(err => {
                  console.error(err)
                  res.status(402).json({ status: 'ERROR', msg: 'Tente novamente.' })
                })
              })
          }).catch(_ => {
            productObj['review'] = []
            productObj['avgAndCountStars'] = {}
          })
      })
      .catch((err) => console.log(err))
  }).catch(_ => res.status(402).json({ status: 'ERROR', msg: 'Tente novamente.' }))
})

module.exports = router
