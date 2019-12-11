class LikesController < ApplicationController

    def create
        # p params

        house = House.find(params[:house_id])
        like = house.likes.find_by(user: 1)

        respond_to do |format|
            format.html do
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

            format.js do
                if like
                    like.destroy()
                else
                    like = house.likes.create(user: User.find(1))
                end

                @like_house = like.id ? house.id : false
            end
        end


    end

    # def destroy
    #     p params
    # end
end