class V1::CourseManagement::AttemptresultsController < V1::ApplicationController
    before_action :doorkeeper_authorize!

    #get all questions in an attempt
 #   post "v1/course_management/exercise/summary/:id"
    def summary
        @summary=AttemptResult.where(attempt_id:params[:id])
        render json: @summary, status: 200
    end

    def result
        @res=AttemptResult.where(attempt_id:params[:id],question_id:qparams[:quesid])
        render json: @res, status:200
    end

    def results
        @qs=AttemptResult.where(attempt_id:params[:id]).count
        @score=AttemptResult.where(attempt_id:params[:id],result:true).count
        @accuracy=100*@score/@qs
        @speed=AttemptResult.where(attempt_id:params[:id]).average(:timetaken)
        @duration=AttemptResult.where(attempt_id:params[:id]).sum(:timetaken)
        render json: {score:@score,accuracy:@accuracy,speed:@speed,duration:@duration}, status:200
    end

    protected

    def qparams
        params.permit(:quesid)
    end
end