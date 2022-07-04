namespace :v1 do
    namespace :course_management do
        get "/courseselection", to: "courses#create"
    end
end