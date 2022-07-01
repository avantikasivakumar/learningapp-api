module V1
    module Meta
        class Meta::SubjectController < ApplicationController
            before_action :set_subject, only: [:show, :update, :destroy]

            #GET v1/meta/subject
            def index
            @subjects = Subject.all
            json_response(@subjects)
            end

            # POST /v1/meta/subject
            def create
                @subject = Subject.create!(bparams)
                json_response(@subject, :created)
            end

            # GET /v1/meta/subject/:id
            def show
                json_response(@subject)
            end

            # PUT /v1/meta/subject/:id
            def update
                @subject.update(bparams)
                head :no_content
            end

            # DELETE /v1/meta/subject/:id
            def destroy
                @subject.destroy
                head :no_content
            end

            private

            def bparams
                # whitelist params
                params.permit(:name, :image)
            end

            def set_subject
                @subject = Subject.find(params[:id])
            end
        end
    end
end
