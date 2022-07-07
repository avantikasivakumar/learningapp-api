class V1::CourseManagement::AttemptResultsController < V1::ApplicationController
    before_action :doorkeeper_authorize!

    #get all questions in an attempt
 #   post "v1/course_management/exercise/summary/:id"
    def summary
        @summary=AttemptResult.where(attempt_id:(Attempt.where(exercise_id:params[:id]).id))
        json_response(summary)
    end

end