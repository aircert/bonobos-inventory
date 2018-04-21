# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Items API' do
  # Initialize the test data
  let!(:product) { create(:product, product_key: 2) }
  let!(:items) { create_list(:item, 20, product_id: product.id, product_key: product.product_key) }
  let(:product_id) { product.id }
  let(:id) { items.first.id }

  # Test suite for GET /products/:product_id/items
  describe 'GET /products/:product_id/items' do
    before { get "/products/#{product_id}/items" }

    context 'when product exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all product items' do
        expect(json.size).to eq(20)
      end
    end

    context 'when product does not exist' do
      let(:product_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product with 'id'=0/)
      end
    end
  end

  # Test suite for GET /products/:product_id/items/:id
  describe 'GET /products/:product_id/items/:id' do
    before { get "/products/#{product_id}/items/#{id}" }

    context 'when product item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when product item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for PUT /products/:product_id/items
  describe 'POST /products/:product_id/items' do
    let(:valid_attributes) { { waist: 28, length: 32, product_key: 2, style: 'blue', count: 19 } }
    let(:product_id) { product.id }
    let(:id) { items.first.id }

    context 'when request attributes are valid' do
      before { post "/products/#{product_id}/items", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/products/#{product_id}/items", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Product key can't be blank, Waist can't be blank, Length can't be blank, Style can't be blank, Count can't be blank/)
      end
    end
  end

  # Test suite for PUT /products/:product_id/items/:id
  describe 'PUT /products/:product_id/items/:id' do
    let(:valid_attributes) { { waist: 32, length: 32, product_key: 2, style: 'blue', count: 19 } }

    before { put "/products/#{product_id}/items/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.waist).to match(32)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /products/:id
  describe 'DELETE /products/:id' do
    before { delete "/products/#{product_id}/items/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end