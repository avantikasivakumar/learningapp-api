module V1
    module Meta
        class TopicsController < ApplicationController

            #GET v1/meta/topic/:id
            def show
            #@course = Course.find(params[:id])
            @topics=Topic.where(:course_id => params[:id])
            json_response(@topics)
            end
        end
    end
end