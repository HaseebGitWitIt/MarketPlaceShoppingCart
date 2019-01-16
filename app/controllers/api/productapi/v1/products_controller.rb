module Api
   module Productapi
      module V1

         # The ProductsController is used to show, create, delete and manipulate data in the products table.
         class ProductsController < ApplicationController

            # This action is used to show all the products in the market place.
            def index
               products = Product.order(:id)
               render json: {
                  status: 'SUCCESS',
                  message: 'Loaded products',
                  data: products
               }, status: :ok
            end

            # This action is used to show a specific product in the market place (given an id).
            def show
               product = Product.find(params[:id])
               render json: {
                  status: 'SUCCESS',
                  message: 'Loaded specific product',
                  data: product
               }, status: :ok
            end

            # This action is used to add a product to the market place (given a title, price and quantity).
            def create
               product = Product.new(product_params)
               if product.save
                  render json: {
                     status: 'SUCCESS',
                     message: 'Created specific product',
                     data: product
                  }, status: :ok
               else
                  render json: {
                     status: 'ERROR',
                     message: 'Could not create specific product',
                     data: product.errors
                  }, status: :unprocessable_entity
               end
            end

            # This action is used to remove a product from the market place (given an id). Note that this will also remove the item from shopping carts.
            def destroy
               product = Product.find(params[:id])
               product.destroy
               removeFromShoppingCart = ShoppingCart.where(product_num: params[:id])
               removeFromShoppingCart.all.each do |x|
                  x.destroy
               end
               render json: {
                  status: 'SUCCESS',
                  message: 'Removed specific product',
                  data: product
               }, status: :ok
            end

            # This action is used to update a specific product in the market place (given an id and updated parameters).
            def update 
               product = Product.find(params[:id])
               if product.update_attributes(product_params)
                  render json: {
                     status: 'SUCCESS',
                     message: 'Updated specific product',
                     data: product
                  }, status: :ok
               else
                  render json: {
                     status: 'ERROR',
                     message: 'Could not update specific product',
                     data: product.errors
                  }, status: :unprocessable_entity
               end
            end

            # This action can be used to display all the products in the market place (if false is passed as the 'onlyavail' variable) or only the products that are still in stock (quantity > 0), (if true is passed as the 'onlyavail' variable).
            def showMarketPlace
               if params[:onlyavail].to_s == "true"
                  products = Product.where("quantity > 0").order(:id)
                  render json: {
                     status: 'SUCCESS',
                     message: 'Loaded available products',
                     data: products
                  }, status: :ok
               elsif params[:onlyavail].to_s == "false"
                  products = Product.order(:id)
                  render json: {
                     status: 'SUCCESS',
                     message: 'Loaded all products',
                     data: products
                  }, status: :ok
               else
                  render json: {
                     status: 'ERROR',
                     message: 'Invalid URL. Please double check the URL you entered.',
                     data: "Cannot show data for security reasons"
                  }, status: :unprocessable_entity
               end
              
            end

            private

            def product_params
               params.permit(:title, :price, :quantity)
            end

         end
      end
   end
end
