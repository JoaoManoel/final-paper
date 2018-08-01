const router = require('express').Router()

router.use('/recommendation', require('./recommendation'))

module.exports = router