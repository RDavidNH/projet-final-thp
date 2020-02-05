class UserMailer < ApplicationMailer
    default from: 'hoomiesmada@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'https://hoomies.herokuapp.com'

		mail(to: @user.email, subject: 'Bienvenue chez hoomies ! Votre inscription a été enrgistré avec succées')
	end
end
