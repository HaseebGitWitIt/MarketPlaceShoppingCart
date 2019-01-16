class Product < ApplicationRecord
   # This is used to validate that when a product is entered into the products table, it should have a title, price and quantity (otherwise the market place may get corrupted)
   validates :title, presence:true
   validates :price, presence:true
   validates :quantity, presence:true
end
