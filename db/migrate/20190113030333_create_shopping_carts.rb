class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    # Created shopping_carts table (stores the relationship between individual products and grouped products (aka shopping cart)), where:
    #   shopping_cart_num: The number associated with the shopping cart
    #   product_num: The product associated with the shopping cart
    # NOTE: total_price was added to the table later on in file: 20190115163137_add_total_price_to_shopping_carts.rb
    create_table :shopping_carts do |t|
      t.integer :shopping_cart_num
      t.integer :product_num

      t.timestamps
    end
  end
end
