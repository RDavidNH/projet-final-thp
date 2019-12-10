class LikesController < ApplicationController

    def create
        p params

        house = House.find(params[:house_id])
        like = house.likes.new(user: User.find(1))

        if like.save
            redirect_to houses_path
        end

    end

    def destroy
        p params
    end
end
