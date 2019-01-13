Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'productapi' do
      namespace 'v1' do
        resources :products 
      end
    end
    namespace 'shoppingcartapi' do
      namespace 'v1' do
        resources :shopping_carts do
          member do
            post '/purchase' => 'shopping_carts#purchase'
            get '/getShoppingCartItems' => 'shopping_carts#getShoppingCartItems'
          end
        end
      end
    end
  end
end
