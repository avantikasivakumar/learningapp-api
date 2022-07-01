namespace :v1 do
    namespace :meta do
        resources :board#, only: %i[show]
    end
end