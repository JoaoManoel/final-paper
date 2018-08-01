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
    },
    createCC: (cc, callback) => {
      const text = dbUtils().createInsertQuery('card', cc)
      db().query(text, Object.values(cc), callback)
    },
    findCCById: (card_id, callback) => {
      const text = `SELECT cc.id as creditcard_id, cc.exp_month,
        cc.exp_year, cc.brand, cc.last4, c.*, a.*
        FROM card cc, client c, address a 
        WHERE cc.id = $1 AND cc.client_id = c.id AND cc.address_id = a.id`
      db().query(text, [card_id], callback)
    },
    findAllCCByClient: (client_id, callback) => {
      const text = `SELECT cc.id as creditcard_id, cc.exp_month,
        cc.exp_year, cc.brand, cc.last4, c.*, a.*
        FROM card cc, client c, address a 
        WHERE cc.client_id = $1 AND cc.client_id = c.id AND cc.address_id = a.id`
      db().query(text, [client_id], callback)
    },
    deleteCC: (card_id, callback) => {
      const text = `DELETE FROM CARD WHERE id = $1`
      db().query(text, [card_id], callback)
    }
  }
}
