module Api
   module Shoppingcartapi
      module V1

         # The ShoppingCartsController is used to show, create, delete and manipulate data in the shopping_carts controller.
         class ShoppingCartsController < ApplicationController

            # This action is used to show all the shopping carts.
            def index
               shoppingCarts = ShoppingCart.order(:id)
               setTotalPrice
               render json: {
                  status: 'SUCCESS',
                  message: 'Loaded shopping carts',
                  data: shoppingCarts
               }, status: :ok
            end

            # This action is used to show a specific shopping cart (given an id).
            def show
               shoppingCart = ShoppingCart.find(params[:id])
               setTotalPrice
               render json: {
                  status: 'SUCCESS',
                  message: 'Loaded specific shopping cart',
                  data: shoppingCart
               }, status: :ok
            end

            # This action is used to associate a shopping cart with a product (given a shopping cart number and a product number).
            def create
               shoppingCart = ShoppingCart.new(shopping_cart_params)
               setTotalPrice
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

            # This action is used to remove an association between a shopping cart and product (given an id).
            def destroy
               shoppingCart = ShoppingCart.find(params[:id])
               shoppingCart.destroy
               setTotalPrice
               render json: {
                  status: 'SUCCESS',
                  message: 'Removed specific shopping cart',
                  data: shoppingCart
               }, status: :ok
            end

            # This action is used to update the data of the relationship between a shopping cart and product (given a shopping cart number and/or product number)
            def update 
               shoppingCart = ShoppingCart.find(params[:id])
               setTotalPrice
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

            # This action is used to purchase all the items within a shopping cart (provided a shopping cart number). Items that are out of stock will be ignored.
            def purchase
               productIds = ShoppingCart.select('product_num').where(shopping_cart_num: params[:shoppingcartnum])
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

            # This action is used by the user to view the products associated with a given shopping cart (given a shopping cart number)
            def getShoppingCartItems
               productIds = ShoppingCart.select('product_num').where(shopping_cart_num: params[:shoppingcartnum])
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

            # This method is used within most actions to update the total price of all the products associated with a shopping cart.
            def setTotalPrice
               ShoppingCart.all.each do |shoppingcart|
                  shopCartNum = shoppingcart.shopping_cart_num
                  productIds = ShoppingCart.select('product_num').where(shopping_cart_num: shopCartNum)
                  products = Product.where(id: productIds)
                  totalPrice = 0
                  products.all.each do |p|
                     totalPrice += p.price
                  end
                  shoppingcart.total_price = totalPrice
                  shoppingcart.save
               end
            end

         end
      end
   end
end
