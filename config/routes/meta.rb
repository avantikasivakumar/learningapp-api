namespace :v1 do
    namespace :meta do
        resources :board, only: %i[create]
    end
end