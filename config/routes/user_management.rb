namespace :v1 do
    namespace :user_management do
        resources :user, only: %i[create]
        resources :session, only: %i[create destroy]
    end
end

scope module: :v1, constraints: ApiVersion.new('V1', true) do
    scope :user_management do
        use_doorkeeper do
            skip_controllers :authorizations, :applications, :authorized_applications
        end
    end
end
