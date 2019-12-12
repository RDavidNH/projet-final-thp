class UsersController < ApplicationController
	before_action :authenticate_user, only: [:profil]
  def profil
  	@user = current_user
  end
end
