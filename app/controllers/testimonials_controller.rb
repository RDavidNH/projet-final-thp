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
	  	@testimonial = Testimonial.new(content: params[:content], rating: params[:rating])
	  	@testimonial.user = current_user
	  	@testimonial.save
	  	redirect_to '/'
  	end
  end

  def edit
    @testimonial = Testimonial.find(current_user.testimonial.id)
  end

  def update
    p params
    p params[:testimonial][:content]
    p params[:testimonial][:rating]
    testimonial = Testimonial.find(current_user.testimonial.id)
    testimonial.update(content: params[:testimonial][:content], rating: params[:testimonial][:rating])



    redirect_to users_profil_path
  end

end
