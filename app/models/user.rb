class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
	before_save {email.downcase!}

	validates :name, presence: true, length: {maximum: 70}

	validates :birthdate, presence: true

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates_presence_of   :email
    validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => true, :if => :email_changed?
    validates_format_of     :email, with: VALID_EMAIL_REGEX, allow_blank: true, if: :email_changed?
    validates               :email, length: {maximum: 255}

	validates_presence_of 	  :password, :on => :create
	validates_confirmation_of :password, :on => :create
	validates_length_of       :password, :within => Devise.password_length, allow_blank: true
	
end


