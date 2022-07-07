module V1
    module Meta
        class TopicsController < ApplicationController
            before_action :doorkeeper_authorize!
            #GET v1/meta/topic/:id
            def show
            #@course = Course.find(params[:id])
            if (CoursesUser.where(user_id:current_user.id).where(course_id:params[:id]).count) == 0#"user_id = ? AND course_id = ?", current_user.id,params[:id])).count == 0
                render json: { error: 'Not enrolled' }, status: 422
            else
            @topics=Topic.where(:course_id => params[:id])
            json_response(@topics)
            end
        end
        end
    end
end