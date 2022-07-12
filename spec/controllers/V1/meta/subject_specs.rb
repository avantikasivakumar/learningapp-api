require 'rails_helper'
include RequestSpecHelper

require 'rails_helper'

RSpec.describe 'Meta subjects', type: :request do
  # initialize test data
  let!(:subjects) { create_list(:subject, 10) }
  #let(:sid) { subjects.first.id }

  
  describe 'GET /v1/meta/subject' do
    # make HTTP get request before each example
    before { get '/v1/meta/subject' }

    it 'returns subjects' do
     # puts json
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(json[0]["id"]).to eq(subjects[0]["id"])
      expect(json[0]["image"]).to eq(subjects[0]["image"])
      expect(json[0]["title"]).to eq(subjects[0]["title"])

      expect(json[1]["id"]).to eq(subjects[1]["id"])
      expect(json[1]["image"]).to eq(subjects[1]["image"])
      expect(json[1]["title"]).to eq(subjects[1]["title"])

      expect(json[2]["id"]).to eq(subjects[2]["id"])
      expect(json[2]["image"]).to eq(subjects[2]["image"])
      expect(json[2]["title"]).to eq(subjects[2]["title"])

      expect(json[3]["id"]).to eq(subjects[3]["id"])
      expect(json[3]["image"]).to eq(subjects[3]["image"])
      expect(json[3]["title"]).to eq(subjects[3]["title"])

      expect(json[4]["id"]).to eq(subjects[4]["id"])
      expect(json[4]["image"]).to eq(subjects[4]["image"])
      expect(json[4]["title"]).to eq(subjects[4]["title"])

      expect(json[5]["id"]).to eq(subjects[5]["id"])
      expect(json[5]["image"]).to eq(subjects[5]["image"])
      expect(json[5]["title"]).to eq(subjects[5]["title"])

      expect(json[6]["id"]).to eq(subjects[6]["id"])
      expect(json[6]["image"]).to eq(subjects[6]["image"])
      expect(json[6]["title"]).to eq(subjects[6]["title"])

      expect(json[7]["id"]).to eq(subjects[7]["id"])
      expect(json[7]["image"]).to eq(subjects[7]["image"])
      expect(json[7]["title"]).to eq(subjects[7]["title"])

      expect(json[8]["id"]).to eq(subjects[8]["id"])
      expect(json[8]["image"]).to eq(subjects[8]["image"])
      expect(json[8]["title"]).to eq(subjects[8]["title"])

      expect(json[9]["id"]).to eq(subjects[9]["id"])
      expect(json[9]["image"]).to eq(subjects[9]["image"])
      expect(json[9]["title"]).to eq(subjects[9]["title"])
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # # Test suite for GET /v1/meta/subject/:id
  # describe 'GET /v1/meta/subject/:id' do
  #   before { get "/v1/meta/subject/#{sid}" }

  #   context 'when the record exists' do
  #     it 'returns the subject' do
  #       expect(json).not_to be_empty
  #       expect(json['id']).to eq(sid)
  #     end

  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #   end

  #   context 'when the record does not exist' do
  #     let(:sid) { 100 }

  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end
  #   end
  # end

  # # Test suite for POST /v1/meta/subject
  # describe 'POST /v1/meta/subject' do
  #   let(:valid_attributes) { { title: 'math', image: '\math' } }

  #   context 'when the request is valid' do
  #     before { post '/v1/meta/subject', params: valid_attributes }

  #     it 'creates a subject' do
  #       expect(json["title"]).to eq('math')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     before { post '/v1/meta/subject', params: { title: 'Foobar' } }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #   end
  # end

  # # Test suite for PUT /v1/meta/subject/:id
  # describe 'PUT /v1/meta/subject/:id' do
  #   let(:valid_attributes) { { title: 'CBSE' } }

  #   context 'when the record exists' do
  #     before { put "/v1/meta/subject/#{sid}", params: valid_attributes }

  #     it 'updates the record' do
  #       expect(response.body).to be_empty
  #     end

  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end

  # # Test suite for DELETE /v1/meta/subject/:id
  # describe 'DELETE /v1/meta/subject/:id' do
  #   before { delete "/v1/meta/subject/#{sid}" }

  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end