class TestimonialsController < ApplicationController
  
  def new
  	@testimonial = Testimonial.new()
  end

  def create
  	if current_user.testimonial
  		testimonial = Testimonial.find(current_user.testimonial.id)
  		testimonial.update(content: params[:content])
  		redirect_to '/'
  	else
	  	@testimonial = Testimonial.new(content: params[:content])
	  	@testimonial.user = current_user
	  	@testimonial.save
	  	redirect_to '/'
  	end
  end

end
