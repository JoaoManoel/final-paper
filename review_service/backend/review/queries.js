const db = require('../db')

function populateInsertValues(params) {
  let q = ''
  const keys = Object.keys(params)

  keys.map((key, index) => {
    value = params[key]
    if (typeof value === 'string') q += `'${value}'`
    else q += `${value}`

    if (index !== keys.length - 1)
      q += ','
  })

  return q
}

module.exports = () => {
  return {
    createNewReview(params, callback) {
      let query = `INSERT INTO review (${ Object.keys(params).join(',') })
        VALUES (${ populateInsertValues(params) })`
      db().query(query, [], callback)
    },
    findReviewByProductId(params, callback) {
      const query = 'SELECT * FROM review WHERE product_id = $1 OFFSET $2 LIMIT $3'
      const q = params.quantity
      const p = params.page

      db().query(query, [params.productId, (p - 1) * q , q], callback)
    },
    getStarAvgAndStarsCountByProductId(product_id, callback) {
      const query = `
        SELECT
        avg(
          CASE WHEN stars = '0' THEN 0
             WHEN stars = '1' THEN 1
             WHEN stars = '2' THEN 2
             WHEN stars = '3' THEN 3
             WHEN stars = '4' THEN 4
             WHEN stars = '5' THEN 5
          END
        ) as avg_star,

        count(
          CASE WHEN stars = '0' THEN 0 END
        ) as zero_star,
        count(
          CASE WHEN stars = '1' THEN 1 END
        ) as one_star,
        count(
          CASE WHEN stars = '2' THEN 2 END
        ) as two_star,
        count(
          CASE WHEN stars = '3' THEN 3 END
        ) as three_stars,
        count(
          CASE WHEN stars = '4' THEN 4 END
        ) as four_stars,
        count(
          CASE WHEN stars = '5' THEN 5 END
        ) as five_stars  

        FROM review WHERE product_id = $1;
      `
      
      db().query(query, [product_id], callback)
    }
  }
}