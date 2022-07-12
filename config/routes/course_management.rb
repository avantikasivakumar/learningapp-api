namespace :v1 do
    namespace :course_management do
        get "/courseselection", to: "courses#create"
        post "/exercise/:id", to: "questions#startex"
        get "/exercise/:id/questions", to: "questions#show"
        post "/question/:id", to: "questions#select"

        get "/material/stat/:id", to: "materialstat#details"
        post "/material/vote/:id", to: "materialstat#vote"
        post "/material/edit/:id", to: "materialstat#editnotes"
        post "/material/done/:id", to: "materialstat#completed"

        post "/exercise/summary/:id", to: "attemptresults#summary"
        post "/exercise/results/:id", to: "attemptresults#results"
    end
end