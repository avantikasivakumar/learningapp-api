class V1::CourseManagement::CoursesController < V1::ApplicationController
    before_action :doorkeeper_authorize!
    #before_action :authenticate_user!
    #    #GET    /v1/course_management/courseselection

    def create
        cid1=Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'1').id
        # @course = Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'1')
        # current_user.CoursesUser.create!(course: @course)
        CoursesUser.create!(course_id:cid1,user_id: current_user.id)
        cid2=Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'2').id
        CoursesUser.create!(course_id:cid2,user_id: current_user.id)
        cid3=Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'3').id
        CoursesUser.create!(course_id:cid3,user_id: current_user.id)
        cid4=Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'4').id
        CoursesUser.create!(course_id:cid4,user_id: current_user.id)
        cid5=Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'5').id
        CoursesUser.create!(course_id:cid5,user_id: current_user.id)
        for cid in [cid1,cid2,cid3,cid4,cid5] do
            @topics=Topic.where(course_id:cid)
            for topic in @topics do
                @materials=Material.where(topic_id:topic.id)
                for mat in @materials do
                    Materialstat.create!(material_id:mat.id,user_id:current_user.id,status:false)
                end
            end
        end
    end

    private

    def course_params
        params.permit(:board_id, :classn_id)
    end

end