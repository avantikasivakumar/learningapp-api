require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'User management', type: :request do
    # initialize test data
    let!(:users) { create_list(:user, 10) }
    let(:user_id) { users.first.id }
  
    # Test suite for POST /v1/user_management/user
    describe 'Sign Up' do
        let (:invalidmail) { "peppa@rq.com" }
        let (:name) { Faker::Name.name }
        let (:email) { Faker::Internet.email }
        let (:dob) {Faker::Date.birthday(min_age: 18, max_age: 65)}
        let (:mobile) {Faker::PhoneNumber.phone_number}
        let (:password) {Faker::Lorem.characters(number: 6)}


        context 'when the request is valid' do
            before { post '/v1/user_management/user', params: {name:name,email:email,dob:dob,mobile:mobile,password:password } }

            it 'creates a user' do
                expect(json).not_to be_empty
                expect(json["user"]).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end

        context 'when the request is invalid' do
        before { post '/v1/user_management/user', params: { email:invalidmail } }

        it 'returns status code 422' do
            expect(response).to have_http_status(422)
        end
        end
    end

    # Test suite for POST /v1/user_management/session
    describe 'Login' do
        let (:email) { users.first.email }
        let (:password) {Faker::Lorem.characters(number: 4)}


        context 'when the request is valid' do
            before { post '/v1/user_management/session', params: {email:email,password:users.first.password } }

            it 'signs in the user' do
                expect(json).not_to be_empty
            #    expect(json["user"]).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end

        context 'when the request is invalid' do
            before { post '/v1/user_management/session', params: { email:email,password:password } }

            it 'returns status failed' do
                expect(json["status"]).to eq('failed')
            end
        end
    end

    # Test suite for DELETE /v1/user_management/session/:id
    describe 'Logout' do
        let (:email) { users.first.email }
        let (:password) {users.first.password}


        context 'when the request is valid' do
            before { delete '/v1/user_management/session/:id', params: {email:email,password:users.first.password } }

            it 'signs in the user' do
                expect(json).not_to be_empty
           #     expect(json[user]).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end

        context 'when the request is invalid' do
            before { post '/v1/user_management/session', params: { email:email,password:password } }

            it 'returns status failed' do
                expect(json["status"]).to eq('failed')
            end
        end
    end
end