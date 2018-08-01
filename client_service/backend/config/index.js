module.exports = {
  database: {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'postgres',
    database: process.env.DB_NAME || 'socks_client',
    max: 50
  },
  email: {
    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
      user: '',
      pass: ''
    }
  }
}
