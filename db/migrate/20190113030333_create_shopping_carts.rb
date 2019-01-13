class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.integer :shopping_cart_num
      t.integer :product_num

      t.timestamps
    end
  end
end
