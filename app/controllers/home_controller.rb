class HomeController < ApplicationController
  def index
  	@user = current_user
  	@testimonial = Testimonial.all
  end
end
