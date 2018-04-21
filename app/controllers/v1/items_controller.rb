module V1
  # app/controllers/items_controller.rb
  class ItemsController < ApplicationController
    before_action :set_product
    before_action :set_product_item, only: [:show, :update, :destroy]

    # GET /products/:product_id/items
    def index
      json_response(@product.items)
    end

    # GET /products/:product_id/items/:id
    def show
      json_response(@item)
    end

    # POST /products/:product_id/items
    def create
      @product.items.create!(item_params)
      json_response(@product, :created)
    end

    # PUT /products/:product_id/items/:id
    def update
      @item.update(item_params)
      head :no_content
    end

    # DELETE /products/:product_id/items/:id
    def destroy
      @item.destroy
      head :no_content
    end

    private

    def item_params
      params.permit(:product_key, :waist, :length, :style, :count)
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_product_item
      @item = @product.items.find_by!(id: params[:id]) if @product
    end
  end
end