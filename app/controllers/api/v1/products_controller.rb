module Api
   module V1
      class ProductsController < ApplicationController

         def index
            products = Product.order('title DESC')
            render json: {
               status: 'SUCCESS',
               message: 'Loaded products',
               data: products
            }, status: :ok
         end

         def show
            product = Product.find(params[:id])
            render json: {
               status: 'SUCCESS',
               message: 'Loaded specific product',
               data: product
            }, status: :ok
         end

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

         def destroy
            product = Product.find(params[:id])
            product.destroy
            render json: {
               status: 'SUCCESS',
               message: 'Removed specific product',
               data: product
            }, status: :ok
         end

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

         def purchase
            product = Product.find(params[:id])
            if product.quantity > 0
               product.decrement(:quantity)
               if product.save
                  render json: {
                     status: 'SUCCESS',
                     message: 'Bought specific product',
                     data: product
                  }, status: :ok
               else
                  render json: {
                     status: 'ERROR',
                     message: 'Could not purchase specific product',
                     data: product.errors
                  }, status: :unprocessable_entity
               end
            else
               render json: {
                  status: 'ERROR',
                  message: 'Out of stock',
                  data: product
               }, status: :ok
            end
         end

         private

         def product_params
            params.permit(:title, :price, :quantity)
         end

      end
   end
end
