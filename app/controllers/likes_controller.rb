class LikesController < ApplicationController
    def create

         if user_signed_in?
            p "A"* 50
            p current_user.id
            house = House.find(params[:house_id])
            # Taloha
            # like = house.likes.find_by(user: 1)
            like = house.likes.find_by(user: current_user.id)



            respond_to do |format|
                format.html do
                    if like
                        like.destroy()
                        redirect_to houses_path
                    else
                        like = house.likes.new(user: User.find(current_user.id))

                        if like.save
                            redirect_to houses_path
                        end
                    end
                end

                format.js do
                    p "B" * 50
                    p like
                    if like 
                        like.destroy()
                    else
                        like = house.likes.create(user: User.find(current_user.id))
                    end

                    @like_house = like.id ? house.id : false
                end
             end
         else
            render js: "window.location='#{new_user_session_path}'"
         end
        


    end

    # def destroy
    #     p params
    # end
end
