require 'rails_helper'
include RequestSpecHelper

require 'rails_helper'

RSpec.describe 'Meta classes', type: :request do
  # initialize test data
  let!(:classnes) { create_list(:classn, 10) }
 # let(:cid) { classnes.first.id }

  
  describe 'GET /v1/meta/classn' do
    # make HTTP get request before each example
    before { get '/v1/meta/classn' }

    it 'returns classnes' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # # Test suite for GET /v1/meta/classn/:id
  # describe 'GET /v1/meta/classn/:id' do
  #   before { get "/v1/meta/classn/#{cid}" }

  #   context 'when the record exists' do
  #     it 'returns the classn' do
  #       expect(json).not_to be_empty
  #       expect(json['id']).to eq(cid)
  #     end

  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #   end

  #   context 'when the record does not exist' do
  #     let(:cid) { 100 }

  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end
  #   end
  # end

  # # Test suite for POST /v1/meta/classn
  # describe 'POST /v1/meta/classn' do
  #   let(:valid_attributes) { { title: '4' } }

  #   context 'when the request is valid' do
  #     before { post '/v1/meta/classn', params: valid_attributes }

  #     it 'creates a classn' do
  #       expect(json["title"]).to eq('4')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     before { post '/v1/meta/classn', params: { } }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #   end
  # end

  # # Test suite for PUT /v1/meta/classn/:id
  # describe 'PUT /v1/meta/classn/:id' do
  #   let(:valid_attributes) { { title: '6' } }

  #   context 'when the record exists' do
  #     before { put "/v1/meta/classn/#{cid}", params: valid_attributes }

  #     it 'updates the record' do
  #       expect(response.body).to be_empty
  #     end

  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end

  # # Test suite for DELETE /v1/meta/classn/:id
  # describe 'DELETE /v1/meta/classn/:id' do
  #   before { delete "/v1/meta/classn/#{cid}" }

  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end