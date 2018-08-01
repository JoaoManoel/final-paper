const db = require('../db')
const { dbUtils } = require('../helpers')

module.exports = () => {
  return {
    create: (address, callback) => {
      let text = dbUtils().createInsertQuery('address', address)
      text += ' RETURNING id'
      
      db().query(text, Object.values(address), callback)
    },
    byId: (id, callback) => {
      const text = `SELECT * FROM address where id = $1`
      db().query(text, [id], callback)
    },
    update: (address, where, callback) => {
      const text = dbUtils().crateUpdateQuery('address', address, where)
      const values = Object.values(address).concat(Object.values(where))
      db().query(text, values, callback)
    },
    delete: (id, callback) => {
      const text = `DELETE FROM address WHERE id = $1`
      db().query(text, [id], callback)
    }
  }
}
