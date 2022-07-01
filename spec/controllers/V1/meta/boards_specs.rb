require 'rails_helper'
include RequestSpecHelper

require 'rails_helper'

RSpec.describe 'Meta boards', type: :request do
  # initialize test data
  let!(:boards) { create_list(:board, 10) }
  let(:bid) { boards.first.id }

  
  describe 'GET /v1/meta/board' do
    # make HTTP get request before each example
    before { get '/v1/meta/board' }

    it 'returns boards' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /v1/meta/board/:id
  describe 'GET /v1/meta/board/:id' do
    before { get "/v1/meta/board/#{bid}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(bid)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:bid) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for POST /v1/meta/board
  describe 'POST /v1/meta/board' do
    let(:valid_attributes) { { title: 'cbse', name: 'central board', image: '\cbseboard' } }

    context 'when the request is valid' do
      before { post '/v1/meta/board', params: valid_attributes }

      it 'creates a todo' do
        expect(json['title']).to eq('cbse')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/v1/meta/board', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end
  end

  # Test suite for PUT /v1/meta/board/:id
  describe 'PUT /v1/meta/board/:id' do
    let(:valid_attributes) { { title: 'CBSE' } }

    context 'when the record exists' do
      before { put "/v1/meta/board/#{bid}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /v1/meta/board/:id
  describe 'DELETE /v1/meta/board/:id' do
    before { delete "/v1/meta/board/#{bid}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end