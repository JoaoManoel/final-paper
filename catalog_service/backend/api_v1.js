const router = require('express').Router()

router.use('/category', require('./category'))
router.use('/product', require('./product'))
router.use('/model', require('./product_model'))

module.exports = router
