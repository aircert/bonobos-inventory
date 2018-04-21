class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
    json_response(@products)
  end

  # POST /products
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # PUT /products/:id
  def update
    @product.update(product_params)
    head :no_content
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    # whitelist params
    params.permit(:product_id, :product_name, :product_image, :product_description)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end