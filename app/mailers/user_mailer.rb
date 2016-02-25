class UserMailer < ApplicationMailer
	def sample_email(user)
		@user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end
end
