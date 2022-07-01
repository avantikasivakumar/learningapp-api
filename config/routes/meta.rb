namespace :v1 do
    namespace :meta do
        resources :board#, only: %i[show]
        resources :classn
        resources :subject
    end
end