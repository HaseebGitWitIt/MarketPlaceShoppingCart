class ShoppingCart < ApplicationRecord
   # This is to validate that when a shopping cart relationship is entered into the table shopping_carts, a shopping cart number and product are provided (otherwise data may be corrupt without these). Note we do not validate the total price of everything in the shopping cart, because that is calculated in the ShoppingCartController automatically.
   validates :shopping_cart_num, presence:true
   validates :product_num, presence:true
end
