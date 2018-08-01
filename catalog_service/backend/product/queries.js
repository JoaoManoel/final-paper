const db = require('../db')

module.exports = () => {
  return {
    listAll: (callback) => {
      const text = `SELECT * FROM product`
      db().query(text, [], callback)
    },
    byGenre: (genre, callback) => {
      const text = `SELECT p.*, c.id as category_id, c.name as category_name, c.gender as category_gender FROM product p, category c where p.category_id = c.id and c.gender = $1`
      db().query(text, [genre], callback)
    },
    bySKU: (sku, callback) => {
      const text = `SELECT p.id, p.name, p.description, 
      p.detail, p.price, p.category_id, p.weight,
      m.id as model_id, m.sku, m.size, m.color
      FROM PRODUCT p, MODEL m 
      WHERE m.product_id = p.id AND m.sku = $1`
      
      db().query(text, [sku], callback)
    },
    productModel: (productId, callback) => {
      const text = `SELECT p.*, m.sku as model_sku, m.size as model_size, m.color as model_color, m.id as model_id
       FROM product p, model m
       WHERE m.product_id = p.id AND product_id = $1`
      db().query(text, [productId], callback)
    }
  }
}
