class ShoppingCart < ApplicationRecord
   validates :shopping_cart_num, presence:true
   validates :product_num, presence:true
end
