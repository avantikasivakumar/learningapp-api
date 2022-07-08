class V1::CourseManagement::MaterialstatController < V1::ApplicationController
    before_action :doorkeeper_authorize!
 #   post "v1/course_management/material/vote/:id"
    def vote
        Materialstat.where(material_id:params[:id],user_id:current_user.id).update(vote: mat_params[:vote])
        json_response(Materialstat.find_by(material_id:params[:id],user_id:current_user.id))
    end

#    post "v1/course_management/material/edit/:id"
    def editnotes
        Materialstat.where(material_id:params[:id],user_id:current_user.id).update(notes: mat_params[:notes])
        json_response(Materialstat.find_by(material_id:params[:id],user_id:current_user.id))
    end

 #   post "v1/course_management/material/done/:id"
    def completed
        Materialstat.where(material_id:params[:id],user_id:current_user.id).update(status: mat_params[:status])
        json_response(Materialstat.find_by(material_id:params[:id],user_id:current_user.id))
    end

    def details
        render json: Materialstat.where(material_id:params[:id],user_id:current_user.id), status:200
    end

    private

    def mat_params
        params.permit(:vote,:notes,:status)
    end
end