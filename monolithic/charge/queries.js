const db = require('../db')
const { dbUtils } = require('../helpers')

module.exports = () => {
  return {
    create: (charge, callback) => {
      const text = dbUtils().createInsertQuery('charge', charge)
      db().query(text, Object.values(charge), callback)
    },
    findFailedCharges: (callback) => {
      const text = `
        SELECT *, ch.id as charge_id
        FROM charge ch, card c
        WHERE attempts <= 3 
          AND ch.paid = false 
          AND ch.payment_id = c.id
      `

      db().query(text, [], callback)
    },
    update: (params, callback) => {
      const text = `
        UPDATE charge 
        SET paid=$1, 
          processed_at=now(), 
          attempts=$2 
        WHERE id = $3
      `

      db().query(text, [params.is_paid, params.attempts, params.charge_id], callback)
    }
  }
}