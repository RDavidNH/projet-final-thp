class LikesController < ApplicationController

    def create
        p params

        house = House.find(params[:house_id])
        like = house.likes.find_by(user: 1)

        if like
            like.destroy()
            redirect_to houses_path
        else
            like = house.likes.new(user: User.find(1))

            if like.save
                redirect_to houses_path
            end
        end

    end

    # def destroy
    #     p params
    # end
end
