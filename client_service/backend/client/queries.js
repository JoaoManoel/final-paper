const db = require('../db')
const { dbUtils } = require('../helpers')

module.exports = () => {
  return {
    create: (client, callback) => {
      const text = dbUtils().createInsertQuery('client', client)
      db().query(text, Object.values(client), callback)
    },
    byId: (id, callback) => {
      const text = `SELECT * FROM client where id = $1`
      db().query(text, [id], callback)
    },
    update: (client, where, callback) => {
      const text = dbUtils().crateUpdateQuery('client', client, where)
      const values = Object.values(client).concat(Object.values(where))
      db().query(text, values, callback)
    }
  }
}
