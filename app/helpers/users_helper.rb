module UsersHelper
	def age(birthday)
		age = Date.today.year - birthday.year
		age-=1 if Date.today < (birthday + age.years)
		return age
	end
end
