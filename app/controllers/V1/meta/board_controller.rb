module V1
    module Meta
        class Meta::BoardController < ApplicationController
            before_action :set_board, only: [:show, :update, :destroy]

            #GET v1/meta/boards
            def index
            @boards = Board.all
            json_response(@boards)
            end

            # # POST /v1/meta/board
            # def create
            #     @board = Board.create!(bparams)
            #     json_response(@board, :created)
            # end

            # # GET /v1/meta/board/:id
            # def show
            #     json_response(@board)
            # end

            # # PUT /v1/meta/board/:id
            # def update
            #     @board.update(bparams)
            #     head :no_content
            # end

            # # DELETE /v1/meta/board/:id
            # def destroy
            #     @board.destroy
            #     head :no_content
            # end

            # private

            # def bparams
            #     # whitelist params
            #     params.permit(:title, :name, :image)
            # end

            # def set_board
            #     @board = Board.find(params[:id])
            # end
        end
    end
end
