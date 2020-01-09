class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts "#" * 40
    puts request.env["omniauth.auth"]
    puts request.env["omniauth.auth"].info.email
    puts "-" * 100
   
    puts "*" * 40
    if request.env["omniauth.auth"].info.email
      puts "a"* 200
    else
      @user = UserProvider.find_for_facebook_oauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication               
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
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
    redirect_to '/'
    # redirect_to "/users/sign_in"
  end

end