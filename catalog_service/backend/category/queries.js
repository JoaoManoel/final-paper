const db = require('../db')

module.exports = () => {
  return {
    listAll: (callback) => {
      const text = `SELECT * FROM category`
      db().query(text, [], callback)
    }
  }
}
