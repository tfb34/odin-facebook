class User < ApplicationRecord
	before_save :downcase_email

	validates :name, presence: true, length: {maximum: 70}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: {maximum: 255}, 
									  format: {with: VALID_EMAIL_REGEX},
									  uniqueness: {case_sensitive: false}

	validates :birthdate, presence: true

	private

	#convert email to lowercase when saving 
	def downcase_email 
		self.email.downcase!
	end
end
