require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'User management', type: :request do
    # initialize test data
    let!(:users) { create_list(:user, 10) }
    let(:user_id) { users.first.id }
    let!(:user) {create(:user)}
    let!(:valid_headers) { auth_headers(user) }

    describe 'Profile' do
      before { get '/v1/user_management/profile', headers: valid_headers[:auth] }

      it 'returns profile details' do
        expect(json).not_to be_empty
        expect(response).to have_http_status(200)
      end
    end


    # Test suite for POST /v1/user_management/user
    describe 'Sign Up' do
        let (:invalidmail) { "peppa@rq.com" }
        let (:name) { Faker::Name.name }
        let (:email) { Faker::Internet.email }
        let (:dob) {Faker::Date.birthday(min_age: 18, max_age: 65)}
        let (:mobile) {Faker::PhoneNumber.phone_number}
        let (:password) {Faker::Lorem.characters(number: 6)}


        context 'when the request is valid' do
            before { post '/v1/user_management/signup', params: {name:name,email:email,dob:dob,mobile:mobile,password:password } }

            it 'creates a user' do
                expect(json).not_to be_empty
                expect(json["user"]["access_token"]).not_to be_empty
                expect(json["user"]["refresh_token"]).not_to be_empty
                expect(json["user"]["expires_in"]).to eq(7200)
                expect(json["user"]["token_type"]).to eq('bearer')
                expect(json["user"]["email"]).to eq(email)
                expect(response).to have_http_status(200)
            end
        end

        context 'when the request is invalid' do
        before { post '/v1/user_management/signup', params: { user:{email:invalidmail}}}#, password: '123' } }

        it 'returns status code 422' do
            expect(response).to have_http_status(422)
        end
        end
    end

    # Test suite for POST /v1/user_management/session
    describe 'Login' do
        let!(:user) {create(:user)}
        context '(Valid email and password)' do
    
          let(:valid_attributes) {{ email: user.email,password: "Password",grant_type: "password"}}
    
          before { post '/v1/user_management/login', params: valid_attributes, as: :json }
    
          it 'Token generated' do
            expect(json).not_to be_empty
            expect(json["user"]).not_to be_empty
            #raise response.body
            expect(json["token"]).not_to be_empty
            expect(response).to have_http_status(201)
          end
        end

        context '(Login by Refresh Token)' do

            let(:valid_attributes) { {grant_type: "refresh_token",refresh_token: valid_headers[:other]['refresh-token']}}
      
            before { post '/v1/user_management/login', params: valid_attributes, as: :json }
      
            it 'Token generated' do
              expect(json).not_to be_empty
              expect(json["user"]).not_to be_empty
              expect(json["token"]).not_to be_empty
              expect(response).to have_http_status(201)
            end
        end

        context '(Login by OTP)' do

          let(:valid_attributes) { {grant_type: "otp",mobile:user.mobile,otp:1234}}
    
          before { post '/v1/user_management/login', params: valid_attributes, as: :json }
    
          it 'Token generated' do
            expect(json).not_to be_empty
            expect(json["user"]).not_to be_empty
            expect(json["token"]).not_to be_empty
            expect(response).to have_http_status(201)
          end
      end
    end

    #     let (:email) { users.first.email }
    #     let (:password) {Faker::Lorem.characters(number: 4)}


    #     context 'when the request is valid' do
    #         before { post '/v1/user_management/session', params: {user:{email:email,password:password } } }
            
    #         it 'signs in the user' do
    #             puts json
    #             json=JSON.parse(response.body)
    #             expect(JSON.parse(response.body)).not_to be_empty
    #             expect(json["user"]["access_token"]).not_to be_empty
    #             expect(json["user"]["refresh_token"]).not_to be_empty
    #             expect(json["user"]["expires_in"]).to eq(7200)
    #             expect(json["user"]["token_type"]).to eq('bearer')
    #             expect(json["user"]["email"]).to eq(email)
    #             expect(response).to have_http_status(200)
    #         end
    #     end

    #     # context 'when the request is invalid' do
    #     #     before { post '/v1/user_management/session', params: { email:email,password:'password' } }

    #     #     it 'returns status failed' do
    #     #         expect(json["status"]).to eq('failed')
    #     #         expect(response).to have_http_status(401)
    #     #     end
    #     # end
    # end

    # Test suite for DELETE /v1/user_management/session/:id
    describe 'Logout' do
        let!(:user) {create(:user)}
        context 'when the request is valid' do
            before { delete '/v1/user_management/logout', headers: valid_headers[:auth] }
    
            it 'Token Empty' do
              expect(response).to have_http_status(200)
            end
          end
        #     it 'signs out the user' do
        #         expect(response).to have_http_status(200)
        #     end
        # end
    end

end