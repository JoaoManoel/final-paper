const router = require('express').Router()
const queries = require('./queries')

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
        return res.status(404).json({ status: 'ERROR', data: 'Gênero não encontrado.' })

      next({ status: 500, msg: err })
    } else res.json({ status: 'OK', data: response.rows })
  })
})

router.get('/bySKU/:sku', (req, res, next) => {
  const sku = req.params.sku
  queries().bySKU(sku, (err, response) => {
    if (err) next({ status: 500, msg: err })
    else {
      const rows = response.rows
      if (rows.length > 0) {
        res.json({ status: 'OK', data: rows })
      } else res.status(404).json({ status: 'ERROR', msg: 'Produto não encontrado.' })
    }
  })
})

router.get('/:id/model', (req, res, next) => {
  const id = req.params.id

  if (/^[0-9]+$/.test(id)) {
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
  } else res.status(400).json({ status: 'ERROR', msg: 'Id Inválido!' })
})

module.exports = router
