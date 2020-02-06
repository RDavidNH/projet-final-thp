class HousesController < ApplicationController
    before_action :authenticate_user, only: [:new, :edit, :update, :create, :destroy]
    before_action :can_post?, only: [:new, :create]


    layout 'simple_layout', only: [:edit, :new]

    def index
        @title = 'Ventes et locations'

        if params[:status].to_i == 1
            status = 'rent'
            @title = 'Locations'
        elsif params[:status].to_i == 2
            status = 'sell'
            @title = 'Ventes'
        end

        @houses = status ? House.where(:status => status) : House.all

        render layout: 'secondary_layout'
    end

    def show
        @house = House.find(params[:id])
        @longitude = @house.district.longitude
        @latitude  = @house.district.latitude 

        puts "*"*33
        for h in @house.photos
            p url_for h
        end
        puts "*"*33

        render layout: 'secondary_layout'
    end

    def new
        @path_url_is_new = true
        @house = House.new
    end

    def create
        puts "/"*55
        # p current_user
        p params
        # p params[:photos][0]
        # image = MiniMagick::Image.open(params[:photos][0].path()) # or user.avatar.path
        # ii = image.crop('20x30+10+5')
        # p ii.width
        # image[:width] > image[:height]
        puts "/"*55
        # return ;

        @house = House.new(
            title: params[:house][:title],
            description: params[:house][:description],
            room_number: params[:house][:room_number],
            address: params[:house][:address],
            price: params[:house][:price],
            status: params[:house][:status],
            is_available: true,
            user: current_user,
            district: District.find_by(id: params[:house][:district_id]),
            type: Type.find_by(id: params[:house][:type_id])
        )

        @house.feature_ids=(params[:house][:features]);

        @house.photos.attach(params[:photos])

        if @house.save
            post_control
            # add role to user for showing dashboard button
            if current_user.role === nil
                current_user.set_user_role_to_owner
            end

            redirect_to house_path(@house.id), flash: {:success => 'Élément créé avec succès'}
        else
            render :new, layout: 'simple_layout'
        end


        # respond_to do |format|
            # format.html {
            #     @house.title = params[:house][:title],
            #     @house.description = params[:house][:description],
            #     @house.room_number = params[:house][:room_number],
            #     @house.address = params[:house][:address],
            #     @house.price = params[:house][:price],
            #     @house.status = params[:house][:status],
            #     @house.is_available = true,
            #     @house.user = current_user,
            #     @house.district = District.find_by(id: params[:house][:district_id]),
            #     @house.type = Type.find_by(id: params[:house][:type_id])
            #
            #     if @house.save
            #         post_control
            #         redirect_to house_path(@house.id), flash: {:success => 'Élément créé avec succès'}
            #     else
            #         render :new, layout: 'simple_layout'
            #     end
            # }
            # format.json {
                # puts "ok" * 55
                # @house = House.new(
                #     title: params[:house][:title],
                #     description: params[:house][:description],
                #     room_number: params[:house][:room_number],
                #     address: params[:house][:address],
                #     price: params[:house][:price],
                #     status: params[:house][:status],
                #     is_available: true,
                #     user: current_user,
                #     district: District.find_by(id: params[:house][:district_id]),
                #     type: Type.find_by(id: params[:house][:type_id])
                # )
                #
                # @house.feature_ids=(params[:house][:features]);


            # }
        # end

    end

    def edit
        @house = House.find(params[:id])
    end

    def update
         # p params

        @house = House.find(params[:id])

        res = @house.update(
            title: params[:house][:title],
            description: params[:house][:description],
            room_number: params[:house][:room_number],
            address: params[:house][:address],
            price: params[:house][:price],
            status: params[:house][:status],
            is_available: params[:house][:is_available],
            user: current_user,
            district: District.find_by(id: params[:house][:district_id]),
            type: Type.find_by(id: params[:house][:type_id])
        )

        # for picture in params[:photos]
        #     @house.photos.attach(picture)
        # end
        @house.photos.attach(params[:photos])

        @house.feature_ids=(params[:house][:features]);

        if res
            redirect_to house_path(@house.id), flash: {:success => 'Élément modifié avec succès'}
        else
            render :edit, layout: 'simple_layout'
        end

    end

    def destroy
        house = House.find(params[:id])

        if house.destroy
            redirect_to houses_path, flash: {:success => 'Élément supprimé avec succès'}
        end
    end

    def post_control
        if current_user.post_count != 0
            current_user.post_count -= 1
            current_user.save
            if current_user.post_count == 0
                current_user.can_post = false
                current_user.save
            end
        end
    end

    def can_post?
        if current_user.can_post == false
            redirect_to offerservice_index_path
        end
    end
end
