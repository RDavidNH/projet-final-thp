class ContactsController < ApplicationController
    before_action :check_params_not_null, only: [:create]
    def new
        @user = User.find_by(role: 'admin')
    end

    def create
        @contact = Contact.new
        contact_params
        if @contact.email_validation(params[:email])
            email = params[:email]
        else
            redirect_to new_contact_path, flash: {:email => 'Email invalide'}
        end    
    end

    private 

    def contact_params
        params.permit(:fullname, :email, :subject, :message)
    end
    def check_params_not_null 
        if params[:email] === "" || params[:fullname] === "" || params[:subject] === ""
            redirect_to new_contact_path, flash: {:alert => 'Veuillez remplir tous les champs'}
        end
    end

end
