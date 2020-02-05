class ContactsController < ApplicationController
    before_action :check_params_not_null, only: [:create]
    def new
        @user = User.find_by(role: 'admin')
    end

    def create
        # p 'fd' * 50
        # p params
        @contact = Contact.new
        contact_params
        if @contact.email_validation(params[:email])
            email = params[:email]
            subject = params[:subject]
            content = params[:message]
            fullname = params[:fullname]
            if params[:commit] === 'Envoyer'
                MailerToAdminMailer.send_email_to_admin(email, fullname, subject, content ).deliver_now
                redirect_to new_contact_path, flash: {:success => 'Message envoyé avec succés'}        
            end
            
            if params[:commit] === 'Contactez'
                owner_email = params[:owner_email]
                current_house = params[:current_house].to_i
                HoomiesMailer.send_email_to_owner(fullname, owner_email, content, email ).deliver_now                
                redirect_to  house_path(current_house), flash: {:success => 'Message envoyé avec succés'}                        
            end
        else
            redirect_to new_contact_path, flash: {:email => 'Email invalide'}
        end    
    end

    private 

    def contact_params
        params.permit(:fullname, :email, :subject, :message, :owner_email, :current_house)
    end
    def check_params_not_null 
        if params[:email] === "" || params[:fullname] === "" || params[:subject] === ""
            redirect_to new_contact_path, flash: {:alert => 'Veuillez remplir tous les champs'}
        end
    end

end
