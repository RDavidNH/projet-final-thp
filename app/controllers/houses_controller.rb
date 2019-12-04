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
        p params

        @house = House.new(
            title: params[:title],
            description: params[:description],
            room_number: params[:room_number],
            address: params[:address],
            status: params[:status],
            district: District.find(params[:house][:district_id]),
            user: User.find(1),
            type: Type.find(params[:house][:type_id]),
        )

        if @house.save
            redirect_to house_path(@house.id), flash: {:success => 'Élément créé avec succès'}
        end

    end

    def edit
        
    end

    def update
        
    end

    def destroy
        
    end
end
