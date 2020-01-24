class HomeController < ApplicationController

  def index
  	@user = current_user
  	@testimonial = Testimonial.all

    @types = Type.all
    @statuses = {:all => 'Tous', :rent => 'Louer', :sell => 'Vendre'}
    @districts = District.all

  end

end
