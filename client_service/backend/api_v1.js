const router = require('express').Router()

router.use('/user', require('./user'))
router.use('/client', require('./client'))
router.use('/address', require('./address'))

module.exports = router
