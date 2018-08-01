const faker = require('faker')

for (let i = 0; i < 200; i++) {
  console.log(
    `INSERT INTO review (client_id, product_id, review_date, stars, title, comment) 
    VALUES (${faker.random.number(9) + 1}, ${faker.random.number(19) + 1}, now(), '${faker.random.number(5)}', '${faker.lorem.words(3)}', '${faker.lorem.paragraph(1)}');`
  )
}
