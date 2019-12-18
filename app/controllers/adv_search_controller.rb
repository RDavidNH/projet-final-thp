class AdvSearchController < ApplicationController

    def search_house
        render layout: 'secondary_layout'

        
        puts "*"*33
        p House.search_title("House 1").include(:author).where("created_at > ?", 1.year.ago).limit(10)
        # p House.all
        puts "*"*33
    end
end
