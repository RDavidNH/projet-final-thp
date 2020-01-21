class HousesController < ApplicationController
    before_action :authenticate_user, only: [:new, :edit, :update, :create, :destroy]
    before_action :can_post?, only: [:new, :create]
    layout 'simple_layout', only: [:edit, :new]

    def index
        @houses = House.all
        render layout: 'secondary_layout'
    end

    def show
        @house = House.find(params[:id])
        render layout: 'secondary_layout'
    end

    def new
        @house = House.new
    end

    def create
        p current_user
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
            post_control
            redirect_to house_path(@house.id), flash: {:success => 'Élément créé avec succès'}
        else
            render :new, layout: 'simple_layout'
        end

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

        for picture in params[:photos]
            @house.photos.attach(picture)
        end
        # @house.photos.attach(params[:photos])

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
        current_user.post_count += 1
        current_user.save
        if current_user.post_count == 3
            current_user.can_post = false
            current_user.save
        end
    end


    def can_post?
        if current_user.can_post? == false
            redirect_to '/'
        end
    end
end
