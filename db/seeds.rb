# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
   Product.create ( {
      title: Faker::Vehicle.make_and_model,
      price: Faker::Number.decimal(2,3),
      quantity: Faker::Number.between(0,10)
   })
end

5.times do
   Product.create ( {
      title: Faker::Vehicle.make_and_model,
      price: Faker::Number.decimal(2,3),
      quantity: 0
   })
end