# MarketPlaceShoppingCart
Files changed:
   - Gemfile: import/install files
   - app/controllers/api/productapi/v1/products_controller.rb: Product actions
   - app/controllers/api/shoppingcartapi/v1/shopping_carts_controller.rb: Shopping cart actions
   - app/models/product.rb: products table validations
   - app/models/shopping_cart.rb: shopping_carts table validations
   - config/database.yml: Database configuration
   - config/routes.rb: URL to controller configuration
   - db/migrate/20190111021832_create_products.rb: Create products table migration script
   - db/migrate/20190113030333_create_shopping_carts.rb: Create shopping_carts table migration script
   - db/migrate/20190115163137_add_total_price_to_shopping_carts.rb: Add total_price column to shopping_carts migration script
   - db/schema.rb: products and shopping_carts table schema
   - db/seeds.rb: Create fake data in products table (for testing purposes)