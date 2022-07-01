require 'rails_helper'
include RequestSpecHelper

require 'rails_helper'

RSpec.describe 'Meta subjects', type: :request do
  # initialize test data
  let!(:subjects) { create_list(:subject, 10) }
  let(:sid) { subjects.first.id }

  
  describe 'GET /v1/meta/subject' do
    # make HTTP get request before each example
    before { get '/v1/meta/subject' }

    it 'returns subjects' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /v1/meta/subject/:id
  describe 'GET /v1/meta/subject/:id' do
    before { get "/v1/meta/subject/#{sid}" }

    context 'when the record exists' do
      it 'returns the subject' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(sid)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:sid) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for POST /v1/meta/subject
  describe 'POST /v1/meta/subject' do
    let(:valid_attributes) { { title: 'math', image: '\math' } }

    context 'when the request is valid' do
      before { post '/v1/meta/subject', params: valid_attributes }

      it 'creates a subject' do
        expect(json["title"]).to eq('math')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/v1/meta/subject', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end
  end

  # Test suite for PUT /v1/meta/subject/:id
  describe 'PUT /v1/meta/subject/:id' do
    let(:valid_attributes) { { title: 'CBSE' } }

    context 'when the record exists' do
      before { put "/v1/meta/subject/#{sid}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /v1/meta/subject/:id
  describe 'DELETE /v1/meta/subject/:id' do
    before { delete "/v1/meta/subject/#{sid}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end