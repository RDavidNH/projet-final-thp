class HomeController < ApplicationController

  def index
    @user = current_user
    @path_url_is_new = false
  	@testimonial = Testimonial.all

    @types = Type.all
    @statuses = {:all => 'Tous', :rent => 'À louer', :sell => 'À vendre'}
    @districts = District.all

    @rent_prices = {
        1 => '100.000 - 250.000 Ar',
        2 => '250.000 - 500.000 Ar',
        3 => '500.000 - 1.000.000 Ar',
    }

    @sell_prices = {
        1 => '10.000.000 - 15.000.000 Ar',
        2 => '15.000.000 - 20.000.000 Ar',
        3 => '20.000.000 - 30.000.000 Ar',
    }

  end

end
