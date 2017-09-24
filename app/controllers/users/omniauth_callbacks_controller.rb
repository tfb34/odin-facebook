class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def instagram
		@user = User.from_omniauth(request.env["omniauth.auth"])
		puts "******************User is valid? #{@user.valid?}"
		puts "#{@user.errors.full_messages}"
		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      		set_flash_message(:notice, :success, :kind => "Instagram") if is_navigational_format?
		else
			session["devise.instagram_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end

	def gplus

		@user = User.from_omniauth(request.env["omniauth.auth"])
		puts "******************User is valid? #{@user.valid?}"
		puts "!!!!!!!!#{@user.errors.full_messages}"

		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      		set_flash_message(:notice, :success, :kind => "Gplus") if is_navigational_format?
		else
			session["devise.gplus_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end

	def failure
		redirect_to root_path
	end
end
