module.exports = {
  database: {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_NAME || 'socks_review',
    max: 50
  },
  port: process.env.PORT || 2018
}
