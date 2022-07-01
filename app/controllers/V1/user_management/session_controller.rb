module V1
    module UserManagement
        class UserManagement::SessionController < ActionController::Base#< ApiController
            respond_to :json
            skip_before_action :verify_authenticity_token, :raise => false
            before_action :ensure_params_exist, only: [:create]

            def create
                resource = User.find_for_database_authentication(email: params[:user][:email])
                return invalid_login_attempt unless resource
                if resource.valid_password?(params[:user][:password])
                        sign_in("user", resource)
                        access_token = Doorkeeper::AccessToken.create(
                        resource_owner_id: resource.id,
                        refresh_token: generate_refresh_token,
                        expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
                        scopes: ''
                        )
                        
                        # return json containing access token and refresh token
                        # so that user won't need to call login API right after registration
                        
                        render json: {status: "successful", user: { id: resource.id, email: resource.email, access_token: access_token.token,
                        token_type: 'bearer',
                        expires_in: access_token.expires_in,
                        refresh_token: access_token.refresh_token,
                        created_at: access_token.created_at.to_time.to_i }}
                        return
                end
                invalid_login_attempt
            end

            def destroy
                if current_user.present? #&& (params[:id]==current_user.id)
                        sign_out(current_user)
                        render json: {status: "successful", message: "Your Account Logged Out Successfully" }
                else
                        render json: {status: "failed", message: "Authentication token is not valid" }
                end
            end

            protected

            def ensure_params_exist
                    return unless params[:user].blank?
                    render json: {status: "failed", message: "Missing User Parameter"}
            end

            def invalid_login_attempt
                    warden.custom_failure!
                    render json: {status: "failed", message: "Error with your Email or password"}
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