class AddTotalPriceToShoppingCarts < ActiveRecord::Migration[5.1]
  def change
      # Add column total_price to the shopping_carts table (forgot to do so earlier).
      #   total_price: Contains the total price of all the products in the shopping cart.
      # NOTE: Original table was created in file: 20190113030333_create_shopping_carts.rb
    add_column :shopping_carts, :total_price, :decimal
  end
end
