namespace :v1 do
    namespace :user_management do
        post "/signup", to: "user#create"
        get "/profile", to: "user#profile"
        post "/login", to: "session#create"
        delete "/logout", to: "session#destroy"
    end
end

scope module: :v1, constraints: ApiVersion.new('V1', true) do
    scope :user_management do
        use_doorkeeper do
            skip_controllers :authorizations, :applications, :authorized_applications
        end
    end
end
