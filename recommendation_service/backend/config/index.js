module.exports = {
  database: {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER,
    database: process.env.DB_NAME || 'socks_recommendation',
    max: 50
  },
  rabbitMQ: {
    service: process.env.RABBITMQ_SERVICE || 'localhost',
    user: process.env.RABBITMQ_USER || 'guest',
    password: process.env.RABBITMQ_PASS || 'guest',
  },
  port: process.env.PORT || 2020
}
