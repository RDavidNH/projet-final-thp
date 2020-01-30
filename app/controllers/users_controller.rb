class UsersController < ApplicationController
	before_action :authenticate_user, only: [:profil]

  def profil
  	@user = current_user

    render layout: 'secondary_layout'
  end

  def contact
    @user = User.find_by(role: 'admin')
  end

end
