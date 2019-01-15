module Api
   module Productapi
      module V1
         class ProductsController < ApplicationController

            def index
               products = Product.order(:id)
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
