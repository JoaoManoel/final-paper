const router = require('express').Router()

// Catalog Endpoints
router.use('/category', require('./category'))
router.use('/product', require('./product'))
router.use('/model', require('./product_model'))

//  Client Endpoints
router.use('/user', require('./user'))
router.use('/client', require('./client'))
router.use('/address', require('./address'))

// Inventory Endpoints
router.use('/inventory', require('./inventory'))

// Order Endpoints
router.use('/order', require('./order'))

// Recommendation Endpoints
router.use('/recommendation', require('./recommendation'))

// Review Endpoints
router.use('/review', require('./review'))

module.exports = router
