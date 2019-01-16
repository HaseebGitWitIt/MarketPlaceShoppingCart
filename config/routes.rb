Rails.application.routes.draw do
  namespace 'api' do
    namespace 'productapi' do
      namespace 'v1' do
        # Get all default REST actions
        resources :products do
          collection do
            # Show all the items in the market place. :onlyavail is true if the user only wants to see the products in stock, and false if they want to see all the products in the market place.
            get '/showMarketPlace/:onlyavail' => 'products#showMarketPlace'
          end
        end 
      end
    end
    namespace 'shoppingcartapi' do
      namespace 'v1' do
        # Get all default REST actions
        resources :shopping_carts do
          collection do
            # Purchase all the products associated to a shopping cart (must provide shopping cart number)
            post '/purchase/:shoppingcartnum' => 'shopping_carts#purchase'
            # View all the products associated to a shopping cart (must provide shopping cart number)
            get '/getShoppingCartItems/:shoppingcartnum' => 'shopping_carts#getShoppingCartItems'
            # Remove shopping cart (must provide shopping cart number)
            delete '/removeShoppingCart/:shoppingcartnum' => 'shopping_carts#removeShoppingCart'
          end
        end
      end
    end
  end
end
