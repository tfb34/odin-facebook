class User < ApplicationRecord
	before_save {email.downcase!}

	#attr_accessible :date

	validates :name, presence: true, length: {maximum: 70}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: {maximum: 255}, 
									  format: {with: VALID_EMAIL_REGEX},
									  uniqueness: {case_sensitive: false}

	validates :birthdate, presence: true

	
end
