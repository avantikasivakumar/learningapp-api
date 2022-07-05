module Devisefn
    #--Overwrite devise method
    def current_user
      User.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
      #   token = request.headers['Authorization'].presence
      #   if token
      #    @current_user ||= User.find_by_auth_token(token)
      #   end
    end

   def authenticate_with_token!
        render json: { errors: "Not authenticated"}, status: :unauthorized unless current_user.present?
   end

   def not_found
      render json: {errors: 'Not found' }, status: 404
   end
end