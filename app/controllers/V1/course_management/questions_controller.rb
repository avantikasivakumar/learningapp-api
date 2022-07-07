module V1
    module CourseManagement
        class QuestionsController < ApplicationController
            before_action :doorkeeper_authorize!
            
            #POST v1/course_management/exercise/:id
            def startex
                @ex=Exercise.find_by(id:params[:id])
                if @ex != nil
                    @topic=Topic.find_by(id:@ex.topic_id)
                    if (CoursesUser.where(user_id:current_user.id).where(course_id:@topic.course_id).count) == 0
                        render json: { error: 'Not enrolled' }, status: 422
                    else
                        @attempt=Attempt.create!(user_id: current_user.id, exercise_id: params[:id])
                        @questions=Question.where(exercise_id:@ex.id)
                        for @question in @questions do
                            AttemptResult.create!(attempt_id:@attempt.id,question_id:@question.id)
                        end
                    end
                else
                    render json: { error: 'No such exercise' }, status: 404
                end
            end

            #GET v1/course_management/question/:id
            def show
                @question=Question.find_by(id:params[:id])
                if @question != nil
                    @ex=Exercise.find_by(id:@question.exercise_id)
                    @topic=Topic.find_by(id:@ex.topic_id)
                    if (CoursesUser.where(user_id:current_user.id).where(course_id:@topic.course_id).count) == 0
                        render json: { error: 'Not enrolled' }, status: 422
                    else
                        render json: { 'question': @question }, status:200
                        #json_response(@question)
                    end
                else
                    render json: { error: 'No such question' }, status: 404
                end
            end

            #POST v1/course_management/question/:id
            def select
            #    puts params[:id]
                @question=Question.find_by(id:params[:id])

                if @question != nil
                    @ex=Exercise.find_by(id:@question.exercise_id)
                    @topic=Topic.find_by(id:@ex.topic_id)
                    if (CoursesUser.where(user_id:current_user.id).where(course_id:@topic.course_id).count) == 0
                        render json: { error: 'Not enrolled' }, status: 422
                    else
                        @attempt=Attempt.where(user_id: current_user.id).where(exercise_id: @ex.id).last#order('created_at DESC').first
                        @res=false
                        if !qparams[:opt].present?
                            @res=nil
                        elsif qparams[:opt] == @question.correctoption
                            @res=true
                        end
                        AttemptResult.where(question_id:params[:id],attempt_id:@attempt.id).update(timetaken: qparams[:timetaken])
                        AttemptResult.where(question_id:params[:id],attempt_id:@attempt.id).update(markedforreview: qparams[:markedforreview])
                        AttemptResult.where(question_id:params[:id],attempt_id:@attempt.id).update(attempted: true)
                        AttemptResult.where(question_id:params[:id],attempt_id:@attempt.id).update(result: @res)
                        
                        json_response(AttemptResult.find_by(question_id:params[:id],attempt_id:@attempt.id))
                    end
                else
                    render json: { error: 'No such question' }, status: 404
                end
            end

            private
    
            def qparams
            params.permit(:opt,:timetaken,:markedforreview)
            end
            
        end
    end
end