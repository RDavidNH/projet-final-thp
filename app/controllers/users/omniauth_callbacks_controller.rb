class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts "#" * 40
    puts request.env["omniauth.auth"]
    puts "*" * 40
    @user = UserProvider.find_for_facebook_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication               
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = UserProvider.find_for_google_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  
  def failure
    puts "$" * 50
    puts "Failllure"
    redirect_to new_user_session_path
  end

end