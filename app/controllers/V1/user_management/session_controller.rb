module V1
    module UserManagement
        class UserManagement::SessionController < ApplicationController
            respond_to :json
            #skip_before_action :verify_authenticity_token, :raise => false
            #before_action :validate_user!, only: [:destroy]
            #before_action :verify_authenticity_token, only: [:destroy]
            #skip_before_action :verify_authenticity_token
            before_action :doorkeeper_authorize!, only: [:destroy]
            before_action :ensure_params_exist, only: [:create]

            def create
                if params[:grant_type] == "password"

                    throw_error("Email or Password is missing.", :unprocessable_entity) if params[:email].blank? or params[:password].blank?

                    @user = User.authenticate(params[:email], params[:password])
                    throw_error("Email or Password is incorrect.", :unprocessable_entity) if @user.blank?

                    access_token = Doorkeeper::AccessToken.create(
                                    resource_owner_id: @user.id,
                                    refresh_token: generate_refresh_token,
                                    expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
                                    scopes: 'user'
                                        )

                    token = {
                        access_token: access_token.token,
                        token_type: 'bearer',
                        expires_in: access_token.expires_in,
                        refresh_token: access_token.refresh_token,
                        created_at: access_token.created_at
                    }

                    user = UserSerializer.new(@user).as_json

                    render json: { user: user, token: token } , status: :created

                elsif params[:grant_type] == "refresh_token"

                    throw_error("Refresh Token is missing.", :unprocessable_entity) if params[:refresh_token].blank? 

                    access_token = Doorkeeper::AccessToken.find_by(refresh_token: params[:refresh_token])
                    @user = User.find_by(id: access_token.resource_owner_id)

                    throw_error("Token is not valid!.", 401) if @user.blank?

                    access_token.destroy

                    new_token = Doorkeeper::AccessToken.create(
                        resource_owner_id: @user.id,
                        refresh_token: params[:refresh_token],
                        expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
                        scopes: 'user'
                            )

                    token =  {
                        access_token: new_token.token,
                        token_type: 'bearer',
                        expires_in: new_token.expires_in,
                        refresh_token: new_token.refresh_token,
                        created_at: new_token.created_at
                    }

                    user = UserSerializer.new(@user).as_json

                    render json: { user: user, token: token } , status: :created
                end


                # resource = User.find_for_database_authentication(email: params[:user][:email])
                # return invalid_login_attempt unless resource
                # if resource.valid_password?(params[:user][:password])
                #         sign_in("user", resource)
                #         access_token = Doorkeeper::AccessToken.create(
                #         resource_owner_id: resource.id,
                #         refresh_token: generate_refresh_token,
                #         expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
                #         scopes: ''
                #         )
                        
                #         # return json containing access token and refresh token
                #         # so that user won't need to call login API right after registration
                        
                #         render json: {status: "successful", user: { id: resource.id, email: resource.email, access_token: access_token.token,
                #         token_type: 'bearer',
                #         expires_in: access_token.expires_in,
                #         refresh_token: access_token.refresh_token,
                #         created_at: access_token.created_at.to_time.to_i }}
                #         return
                # end
                # throw_error("Email or Password is incorrect.", :unprocessable_entity)
                # #invalid_login_attempt
            end

            def destroy
                #doorkeeper_token.destroy
                if current_user.present?
                        sign_out(current_user)
                        render json: {status: "successful", message: "Your Account Logged Out Successfully" }
                else
                        render json: {status: "failed", message: "Authentication token is not valid" }, status:401
                end
            end

            protected

            def ensure_params_exist
                params.permit(:email, :password, :refresh_token, :grant_type)
                #     return unless params[:user].blank?
                #     render json: {status: "failed", message: "Missing User Parameter"}
            end

            def invalid_login_attempt
                    warden.custom_failure!
                    render json: {status: 401, message: "Error with your Email or password"}, status: 401
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