namespace :v1 do
    namespace :course_management do
        get "/courseselection", to: "courses#create"
        post "/exercise/:id", to: "questions#startex"
        get "/question/:id", to: "questions#show"
        post "/question/:id", to: "questions#select"

        post "/material/vote/:id", to: "materialstat#vote"
        post "/material/edit/:id", to: "materialstat#editnotes"
        post "/material/done/:id", to: "materialstat#completed"

        post "/exercise/summary/:id", to: "attempt_results#summary"
    end
end