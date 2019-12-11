class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?	
   
    protected  
    def configure_permitted_parameters
        # devise_parameter_sanitizer.permit(:account_update, except: [:password], keys: [:firstname, :lastname, :phone, :address])


        devise_parameter_sanitizer.for(:account_update) do |u|
      		u.permit(:firstname, :lastname ,:password,:phone, :address)
    	end
    end  
end