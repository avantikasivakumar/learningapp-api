module V1
    module Meta
        class MaterialController < ApplicationController
            before_action :doorkeeper_authorize!
            
            #GET v1/meta/material/:id
            def show
                @topic=Topic.find_by(id:params[:id])
                if @topic != nil
                    if (CoursesUser.where(user_id:current_user.id).where(course_id:@topic.course_id).count) == 0
                        render json: { error: 'Not enrolled' }, status: 422
                    else
                        #@course = Course.find(params[:id])
                        @mats=Material.where(:topic_id => params[:id])
                        json_response(@mats)
                    end
                else
                    render json: { error: 'No such topic' }, status: 404
                end
            end
        end
    end
end