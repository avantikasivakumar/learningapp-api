module V1
    module Meta
        class Meta::ClassnController < ApplicationController
            before_action :set_class, only: [:show, :update, :destroy]

            #GET v1/meta/classn
            def index
            @classns = Classn.all
            json_response(@classns)
            end

            # POST /v1/meta/classn
            def create
                @classn = Classn.create!(bparams)
                json_response(@classn, :created)
            end

            # GET /v1/meta/classn/:id
            def show
                json_response(@classn)
            end

            # PUT /v1/meta/classn/:id
            def update
                @classn.update(bparams)
                head :no_content
            end

            # DELETE /v1/meta/classn/:id
            def destroy
                @classn.destroy
                head :no_content
            end

            private

            def bparams
                # whitelist params
                params.permit(:title, :image)
            end

            def set_classn
                @classn = Classn.find(params[:id])
            end
        end
    end
end
