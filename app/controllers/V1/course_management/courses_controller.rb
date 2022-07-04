class V1::CourseManagement::CoursesController < V1::ApplicationController
    before_action :doorkeeper_authorize!

    #    #GET    /v1/course_management/courseselection
    def create
        cid=Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'1').id
       # @course = Course.find_by!(board_id: course_params[:board_id],classn_id: course_params[:classn_id],subject_id:'1')
        #current_user.users_courses.create!(course: @course)
        UsersCourse.create!(course_id:cid,user_id:current_user.id)
    end

    private

    def course_params
        params.permit(:board_id, :classn_id)
    end

end