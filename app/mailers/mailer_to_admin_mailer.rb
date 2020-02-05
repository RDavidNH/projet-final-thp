class MailerToAdminMailer < ApplicationMailer
    default from: 'hoomiesmada@gmail.com'

    def send_email_to_admin(email, full_name, subject, content_message )
        @admin_email = 'hoomiesadmin@yopmail.com'
        @email= email
        @full_name = full_name
        @subject = subject
        @content_message = content_message
		# @url = 'https://hoomies.herokuapp.com'

		mail(to: @admin_email, subject: 'Information')
    end
end
