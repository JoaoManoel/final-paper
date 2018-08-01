const db = require('../db')
const randomstring = require('randomstring')

module.exports = () => {
  return {
    create: (user, callback) => {
      const code = randomstring.generate(100)
      const text = `INSERT INTO "user" (email, password, activation_code) 
      VALUES ($1, $2, $3)`

      db().query(text, [user.email, user.password, code], callback)
    },
    activate: (code, callback) => {
      const text = `UPDATE "user" SET is_activated = true WHERE activation_code = $1`
      db().query(text, [code], callback)
    },
    update: (id, password, callback) => {
      const text = `UPDATE "user" set password = $1 WHERE id = $2`
      db().query(text, [password, id], callback)
    },
    findUserByClientId: (id, callback) => {
      const text = `SELECT * FROM "user" u, client c WHERE c.user_id = u.id AND u.id = $1`
      db().query(text, [id], callback)
    },
    recovery: (id, newPassword, callback) => {
      const text = `UPDATE "user" set password = $1 WHERE id = $2`
      db().query(text, [newPassword, id], callback)
    }
  }
}
