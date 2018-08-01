const MongoClient = require('mongodb').MongoClient;

const URL = process.env.MONGO_URL || 'mongodb://localhost:27017'
const dbName = process.env.MONGO_DB || 'this_socks'

module.exports = () => {
  return {
    connect: async (callback) => {
      try {
        const client = await MongoClient.connect(URL, {
          poolSize: 50
        })
        const db = client.db(dbName)
        callback(null, { client, db })
      } catch (e) {
        console.error(e)
        callback(e)
      }
    }
  }
}