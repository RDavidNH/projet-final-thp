class HoomiesMailer < ApplicationMailer
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_email_to_owner(full_name, owner_email, content_message, visitor_email)
      @content_message = content_message
      @full_name = full_name
      @email = owner_email
      @visitor_email = visitor_email

  mail(to: @email, subject: 'Information')        
  end
end
