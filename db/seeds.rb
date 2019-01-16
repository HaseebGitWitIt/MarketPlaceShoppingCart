# Upload random testing data into the products table (just for testing)
20.times do
   Product.create ( {
      title: Faker::Vehicle.make_and_model,
      price: Faker::Number.decimal(2,3),
      quantity: Faker::Number.between(0,10)
   })
end

# Upload some products that are out of stock (just for testing)
5.times do
   Product.create ( {
      title: Faker::Vehicle.make_and_model,
      price: Faker::Number.decimal(2,3),
      quantity: 0
   })
end