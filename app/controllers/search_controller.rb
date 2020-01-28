class SearchController < ApplicationController

    def filter
        criterion = { :district_id => params[:district] }

        if params[:type] != 'all'
            criterion[:type_id] = params[:type]
        end

        if params[:status] == 'rent' || params[:status] == 'sell'
            criterion[:status] = params[:status]
        end

        price_rent_ids = {
            1 => 100000..250000,
            2 => 250000..500000,
            3 => 500000..100000,
        }

        price_sell_ids = {
            1 => 10000000..15000000,
            2 => 15000000..20000000,
            3 => 20000000..30000000,
        }

        if params[:status] == 'rent'
            criterion[:price] = price_rent_ids[params[:rent_price].to_i]
        else params[:status] == 'sell'
            criterion[:price] = price_sell_ids[params[:sell_price].to_i]
        end

        @houses = House.where(criterion)

        render layout: 'secondary_layout'
    end

end
