module Api
   module Shoppingcartapi
      module V1
         class ShoppingCartsController < ApplicationController

            def index
               shoppingCarts = ShoppingCart.order(:id)
               render json: {
                  status: 'SUCCESS',
                  message: 'Loaded shopping carts',
                  data: shoppingCarts
               }, status: :ok
            end

            def show
               shoppingCart = ShoppingCart.find(params[:id])
               render json: {
                  status: 'SUCCESS',
                  message: 'Loaded specific shopping cart',
                  data: shoppingCart
               }, status: :ok
            end

            def create
               shoppingCart = ShoppingCart.new(shopping_cart_params)
               if shoppingCart.save
                  render json: {
                     status: 'SUCCESS',
                     message: 'Created specific shopping cart',
                     data: shoppingCart
                  }, status: :ok
               else
                  render json: {
                     status: 'ERROR',
                     message: 'Could not create specific shopping cart',
                     data: shoppingCart.errors
                  }, status: :unprocessable_entity
               end
            end

            def destroy
               shoppingCart = ShoppingCart.find(params[:id])
               shoppingCart.destroy
               render json: {
                  status: 'SUCCESS',
                  message: 'Removed specific shopping cart',
                  data: shoppingCart
               }, status: :ok
            end

            def update 
               shoppingCart = ShoppingCart.find(params[:id])
               if shoppingCart.update_attributes(shopping_cart_params)
                  render json: {
                     status: 'SUCCESS',
                     message: 'Updated specific shopping cart',
                     data: shoppingCart
                  }, status: :ok
               else
                  render json: {
                     status: 'ERROR',
                     message: 'Could not update specific shopping cart',
                     data: shoppingCart.errors
                  }, status: :unprocessable_entity
               end
            end

            def purchase
               shopCartNum = ShoppingCart.find(params[:id]).shopping_cart_num
               productIds = ShoppingCart.select('product_num').where(shopping_cart_num: shopCartNum)
               products = Product.where(id: productIds)
               anyErrorFlag = false
               products.all.each do |p|
                  if p.quantity > 0
                     p.decrement(:quantity)
                     if !p.save
                        anyErrorFlag = true
                     end
                  else
                     anyErrorFlag = true
                  end
               end
               if anyErrorFlag
                  render json: {
                     status: 'SUCCESS',
                     message: 'Transactions were complete with a few errors. Please review the shopping cart after the transaction',
                     data: products
                  }, status: :ok
               else
                  render json: {
                     status: 'SUCCESS',
                     message: 'Transactions were fully complete successfully',
                     data: products
                  }, status: :ok
               end
            end

            def getShoppingCartItems
               shopCartNum = ShoppingCart.find(params[:id]).shopping_cart_num
               productIds = ShoppingCart.select('product_num').where(shopping_cart_num: shopCartNum)
               products = Product.where(id: productIds)
               render json: {
                  status: 'SUCCESS',
                  message: 'Got items in specific shopping cart',
                  data: products
               }, status: :ok
            end

            private

            def shopping_cart_params
               params.permit(:shopping_cart_num, :product_num)
            end

         end
      end
   end
end
