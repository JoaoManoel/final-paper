const db = require('../db')
const { dbUtils } = require('../helpers')

module.exports = () => {
  return {
    create: (inventory, callback) => {
      const text = dbUtils().createInsertQuery('inventory', inventory)
      db().query(text, Object.values(inventory), callback)
    },
    listAll: (callback) => {
      const text = "SELECT * FROM INVENTORY"
      db().query(text, [], callback)
    },
    findBySKU: (sku, callback) => {
      const text = `SELECT * FROM inventory where sku = $1`
      db().query(text, [sku], callback)
    },
    delete: (id, callback) => {
      db().query('DELETE FROM INVENTORY WHERE id = $1', [id], callback)
    },
    update: ({ sku, status, quantity }, callback) => {
      if (status === 'processing') {
        db().query('SELECT stock_total FROM inventory WHERE sku = $1', [sku], (err, response) => {
          if (err) callback(err, null)
          else {
            if (response.rows.length === 0) {
              return callback({ detail: 'SKU do Produto não encontrado.' })
            }

            const count = response.rows[0].stock_total
            if ((count - quantity) > -1) {
              db().query(`UPDATE inventory 
              SET stock_total = stock_total - $2, 
              stock_reserved = stock_reserved + $2
              WHERE SKU = $1`, [sku, quantity], callback)
            } else {
              callback({ detail: 'Sem estoque ou ultrapassa a quantidade disponível em estoque.' })
            }
          }
        })
      } else if (status === 'confirmed') {
        db().query('SELECT stock_reserved FROM inventory WHERE sku = $1', [sku], (err, response) => {
          if (err) callback(err, null)
          else {
            if (response.rows.length === 0) {
              return callback({ detail: 'SKU do Produto não encontrado.' })
            }

            const count = response.rows[0].stock_reserved
            if ((count - quantity) > -1) {
              db().query(`UPDATE inventory 
              SET stock_reserved = stock_reserved - $2
              WHERE SKU = $1`, [sku, quantity], callback)
            } else {
              callback({ detail: 'Sem estoque ou ultrapassa a quantidade disponível em estoque.' })
            }
          }
        })
      } else if (status === 'canceled') {
        db().query('SELECT stock_reserved FROM inventory WHERE sku = $1', [sku], (err, response) => {
          if (err) callback(err, null)
          else {
            if (response.rows.length === 0) {
              return callback({ detail: 'SKU do Produto não encontrado.' })
            }

            const count = response.rows[0].stock_reserved
            if ((count - quantity) > -1) {
              db().query(`UPDATE inventory 
              SET stock_total = stock_total + $2,
              stock_reserved = stock_reserved - $2
              WHERE SKU = $1`, [sku, quantity], callback)
            } else {
              callback({ detail: 'Sem estoque ou ultrapassa a quantidade disponível em estoque.' })
            }
          }
        })
      }
    }
  }
}
