const db = require('../db')
module.exports = () => {
  return {
    getRecommendedProducts(sku, callback) {
      const text = `
       SELECT sku, product_id
       FROM recommendation r
       WHERE r.product_id not in (
         SELECT product_id
           FROM recommendation r
            WHERE r.sku = $1 LIMIT 1
       ) AND category_id in (
        SELECT product_id
           FROM recommendation r
            WHERE r.sku = $1 LIMIT 1
       )
       ORDER BY RANDOM()
       LIMIT 5;
      `

      db().query(text, [sku], callback)
    },
     getRecommendedProductsByCategory(categoryId, productId, callback) {
      const text = `
        SELECT sku
        FROM recommendation 
        WHERE category_id = $1 AND product_id != $2
        ORDER BY SALES_NUMBER DESC LIMIT 5
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
          (category_id, sku, product_id) 
        VALUES ($1,$2,$3)
      `
      db().query(text, [params.categoryId, params.sku, params.productId], callback)
    }
  }
}
