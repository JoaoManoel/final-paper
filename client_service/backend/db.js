const { Pool } = require('pg')
const { database } = require('./config')

const pool = new Pool(database)

module.exports = () => {
  return {
    query: async (text, values, callback) => {
      let client
      let res

      try {
        client = await pool.connect()
        res = await client.query(text, values)
        callback(null, res)
      } catch (e) {
        callback(e)
      } finally {
        if (client) { client.release() }
      }
    }
  }
}
