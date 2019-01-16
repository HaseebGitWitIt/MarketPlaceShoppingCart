class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    # Created products table (stores all the products in the market place), where:
    #   title: Name of the product in the market place
    #   price: Price of the product in the market place
    #   quantity: The amount of the certain product in the market place
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
