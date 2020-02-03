class UserMailer < ApplicationMailer
    default from: 'beanjarahoussen@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'http://monsite.fr//login'

		mail(to: @user.email, subject: 'Bienvenue chez nous ! Votre inscription a été enrgistré avec succées')
	end
end
