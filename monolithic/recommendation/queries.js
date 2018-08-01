const db = require('../db')
module.exports = () => {
  return {
    getRecommendedProducts(sku, callback) {
      const text = `
       SELECT p.*, m.product_id as product_id, m.id as model_id, m.sku, m.size, m.color
       FROM recommendation r, model m, product p
       WHERE m.product_id not in (
         SELECT product_id
           FROM product p, model m
            WHERE m.product_id = p.id 
            AND m.sku = $1
       ) AND r.sku = m.sku
       AND m.product_id = p.id
        ORDER BY r.sales_number DESC
       LIMIT 5; 
      `
      
      db().query(text, [sku], callback)
    },
    getRecommendedProductsByCategory(categoryId, productId, callback) {
      const text = `
        SELECT p.*, m.sku as model_sku, m.size as model_size, m.color as model_color, m.id as model_id 
        FROM product p, model m 
        WHERE p.category_id = $1 
        AND m.sku NOT IN (	
          SELECT m.sku
            FROM product p, model m
             WHERE m.product_id = p.id 
             AND p.id = $2
        )
        AND p.id = m.product_id ORDER BY random() LIMIT 5
      `

      db().query(text, [categoryId, productId], callback)
    },
    updateSalesNumber(sku, callback) {
      const text = `
        UPDATE recommendation 
        SET sales_number = sales_number + 1
        WHERE sku = $1
      `
      db().query(text, [sku], callback)
    },
    createRecommendation(params, callback) {
      const text = `
        INSERT INTO recommendation 
          (category_id, sku) 
        VALUES ($1,$2)
      `
      db().query(text, [params.categoryId, params.sku], callback)
    }
  }
}