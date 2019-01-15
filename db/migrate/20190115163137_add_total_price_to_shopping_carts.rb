class AddTotalPriceToShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_carts, :total_price, :int
  end
end
