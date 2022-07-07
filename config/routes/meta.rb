namespace :v1 do
    namespace :meta do
        resources :board, only: %i[index]
        resources :classn, only: %i[index]
        resources :subject, only: %i[index]
        get "/topics/:id", to: "topics#show"
        get "/material/:id", to: "material#show"
        get "/exercise/:id", to: "exercise#show"
    end
end