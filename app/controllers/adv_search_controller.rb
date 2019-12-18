class AdvSearchController < ApplicationController

    def search_house
        render layout: 'secondary_layout'

        
        puts "*"*33
        p h = House.search_title("House").search_price("140000").search_address("Donnell").all
        # p PgSearch.multisearch("House 140000")
        # p h.first.user
        # p House.all
        # p PgSearch.multisearch("House 1").limit(10)
        puts "*"*33
    end
end
