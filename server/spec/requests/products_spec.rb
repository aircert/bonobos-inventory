# spec/requests/products_spec.rb
require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  # initialize test data 
  let!(:products) { create_list(:product, 10, product_key: 2) }
  let(:product) { create(:product, product_name: 'washed chinos', product_key: 2) }
  let(:id) { products.first.id }

  # Test suite for GET /products
  describe 'GET /products' do
    
    # make HTTP get request before each example
    before { get '/products' }

    it 'returns products' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['total_count']).to eq(10)
    end

    it 'return products with product_name as washed chimps' do
      get '/products?product_name=washed chimps'
      byebug
      # Note `json` is a custom helper to parse JSON responses
      expect(product.product_name).to eq(json['products'][0]['product_name'])
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /products/:id
  describe 'GET /products/:id' do
    before { get "/products/#{id}" }

    context 'when the record exists' do
      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end

  # Test suite for POST /products
  describe 'POST /products' do
    # valid payload
    let(:valid_attributes) { { product_key: 2, product_name: 'string' , product_image: 'string', product_description: 'string' } }

    context 'when the request is valid' do
      before { post '/products', params: valid_attributes }

      it 'creates a product' do
        expect(json['product_key']).to eq(2)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/products', params: { product_key: 2 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Product name can't be blank, Product image can't be blank, Product description can't be blank/)
      end
    end
  end

  # Test suite for PUT /products/:id
  describe 'PUT /products/:id' do
    let(:valid_attributes) { { product_key: 2 } }

    context 'when the record exists' do
      before { put "/products/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /products/:id
  describe 'DELETE /products/:id' do
    before { delete "/products/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end