module V1
  module UserManagement
      class UserManagement::UserController < ApplicationController
        #before_action :doorkeeper_authorize!
        before_action :doorkeeper_authorize!, only: %i[profile]
    
        def create
          user = User.new(email: user_params[:email], password: user_params[:password], name: user_params[:name], dob: user_params[:dob], mobile: user_params[:mobile])
    # need to verify otp
  
          # client_app = Doorkeeper::Application.find_by(uid: params[:client_id])
    
          # return render(json: { error: 'Invalid client ID'}, status: 403) unless client_app
    
          if user.save
            # create access token for the user, so the user won't need to login again after registration
            access_token = Doorkeeper::AccessToken.create(
              resource_owner_id: user.id,
              refresh_token: generate_refresh_token,
              expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
              scopes: ''
            )

            # return json containing access token and refresh token
            # so that user won't need to call login API right after registration
            render json: {
              user: {
                id: user.id,
                email: user.email,
                access_token: access_token.token,
                token_type: 'bearer',
                expires_in: access_token.expires_in,
                refresh_token: access_token.refresh_token,
                created_at: access_token.created_at.to_time.to_i
              }
            }
          else
            render json: { error: user.errors.full_messages }, status: 422
          end
        end

        def profile
          render json: current_user, status: 200
        end
    
        private
    
        def user_params
          params.permit(:email, :password, :name, :dob, :mobile)
        end
    
        def generate_refresh_token
          loop do
            # generate a random token string and return it, 
            # unless there is already another token with the same string
            token = SecureRandom.hex(32)
            break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
          end
        end 
      end
    end
  end
