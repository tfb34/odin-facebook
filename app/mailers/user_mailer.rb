class UserMailer < ApplicationMailer
	default from: 'notifications@time-out.herokuapp.com'

	def welcome_email(user)
		@user = user
		@url  = 'https://time-out.herokuapp.com/'
		mail(to: @user.email, subject: 'Welcome to Time-Out')
	end
end
