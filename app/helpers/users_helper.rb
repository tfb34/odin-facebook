module UsersHelper
	def age(birthday)
		age = Date.today.year - birthday.year
		age-=1 if Date.today < (birthday + age.years)
		return age
	end

	#returns an image tag for Gravatar with a gravatar CSS class
	def gravatar_for(user, options={size: 80})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

end
