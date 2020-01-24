class SearchController < ApplicationController

    def filter
        criterion = { :district_id => params[:district] }

        if params[:type] != 'all'
            criterion[:type_id] = params[:type]
        end

        if params[:status] == 'rent' || params[:status] == 'sell'
            criterion[:status] = params[:status]
        end

        @houses = House.where(criterion)

        render layout: 'secondary_layout'
    end

end
