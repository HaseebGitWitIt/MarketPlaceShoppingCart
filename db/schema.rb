ActiveRecord::Schema.define(version: 20190115163137) do
  # products table is used to store all the products in the market place.
  # title: Name of the product
  # price: Cost of product
  # quantity: Amount of product in stock
  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.decimal "price", precision: 10
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
  # shopping_carts table is used to store the association between multiple products, making it easier to purchase multiple items at once
  # shopping_cart_num: The shopping cart number
  # product_num: The id of the product associated with the shopping cart
  # total price: The sum of all the products associated with this shopping cart number
  create_table "shopping_carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "shopping_cart_num"
    t.integer "product_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_price", precision: 10
  end

end
