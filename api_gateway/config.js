let MODE = process.env.MODE || 'dev'
let servicesConfiguration = []

if (MODE === 'prod') {
  servicesConfiguration = require('./services_prod.json')
} else {
  servicesConfiguration = require('./services_dev.json')
}

module.exports = {
  servicesConfiguration
}
