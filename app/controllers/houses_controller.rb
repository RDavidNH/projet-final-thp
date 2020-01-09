class HousesController < ApplicationController
    before_action :authenticate_user, only: [:new, :edit, :update, :create, :destroy]
    layout 'simple_layout', only: [:edit, :new]


    def index
        @houses = House.all
        render layout: 'secondary_layout'
    end

    def show
        @house = House.find(params[:id])

        # puts "*"*33 
        # for h in @house.photos 
        #     p url_for h
        # end
        # puts "*"*33

        render layout: 'secondary_layout'
    end

    def new
        @house = House.new
    end

    def create

        p params
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


        # @house.photos.attach(params[:photos])

        @house.feature_ids=(params[:house][:features]);

        if @house.save
            redirect_to house_path(@house.id), flash: {:success => 'Élément créé avec succès'}
        else
            render :new, layout: 'simple_layout'
        end

    end

    def edit
        @house = House.find(params[:id])
    end

    def update
        # puts "*"*33
        # p params
        # # p params.key?(:delete_photos)
        # puts "*"*33
        
        # return
        
        @house = House.find(params[:id])
        
        # puts "*"*33
        # p @house.photos.find([5, 6])
        # puts "*"*33
        # if params.has
            
        # end
# return 

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
        
        if params.key?(:photos)
            for picture in params[:photos]
                @house.photos.attach(picture)
            end
            # @house.photos.attach(params[:photos])
        end

        if params.key?(:edit_photos)
            params[:edit_photos].each do |k, v|
                res = @house.photos.attach(v)
                # puts "*"*33
                # puts "lol " * 33
                # p res.first[:id]
                # puts "*"*33
                if res.length > 0
                    @house.photos.find(k).purge
                end
            end
            # @house.photos.attach(params[:photos])
        end

        if params.key?(:delete_photos)
            for photo in @house.photos.find(params[:delete_photos])
                photo.purge
            end
        end

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
end
