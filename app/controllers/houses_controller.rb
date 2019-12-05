class HousesController < ApplicationController

    def index
        @houses = House.all
    end

    def show
        @house = House.find(params[:id])
    end

    def new
        @house = House.new
    end

    def create
        puts params

        @house = House.new(
            title: params[:title],
            description: params[:description],
            room_number: params[:room_number],
            address: params[:address],
            price: params[:price],
            status: params[:house][:status],
            is_available: params[:is_available],
            district: District.find(params[:house][:district_id]),
            user: User.find(1),
            type: Type.find(params[:house][:type_id]),
        )

        if @house.save
            redirect_to house_path(@house.id), flash: {:success => 'Élément créé avec succès'}
        end

    end

    def edit
        @house = House.find(params[:id])

    end

    def update
        p params

        @house = House.find(params[:id])

        res = @house.update(
            title: params[:title],
            description: params[:description],
            room_number: params[:room_number],
            address: params[:address],
            price: params[:price],
            status: params[:house][:status],
            is_available: params[:is_available],
            district: District.find(params[:house][:district_id]),
            user: User.find(1),
            type: Type.find(params[:house][:type_id]),
        )

        if res
            redirect_to house_path(@house.id), flash: {:success => 'Élément modifié avec succès'}
        end

    end

    def destroy
        house = House.find(params[:id])

        if house.destroy
            redirect_to houses_path, flash: {:success => 'Élément supprimé avec succès'}
        end
    end
end
