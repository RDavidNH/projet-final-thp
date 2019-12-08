class CommentsController < ApplicationController

    def create
        p params

        @comment = Comment.new(
            user: User.find(1),
            commentable: House.find(params[:house_id]),
            content: params[:comment][:content]
        )

        if @comment.save
            redirect_to house_path(params[:house_id])
        end

    end

    def update
        p params
    end

    def destroy
        p params

        house = House.find(params[:house_id])
        house.comments.destroy(params[:id])

        redirect_to house_path(house.id)
    end
end
