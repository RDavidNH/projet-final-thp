class UsersController < ApplicationController

  def profil
  	@user = current_user
  end
end
