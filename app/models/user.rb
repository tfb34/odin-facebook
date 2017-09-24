class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:instagram, :gplus]
	before_save {email.downcase!}
	
	attr_accessor :skip_birthdate

	validates :name, presence: true, length: {maximum: 70}

	validates :birthdate, presence: true, unless: :skip_birthdate

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates_presence_of   :email
    validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => true, :if => :email_changed?
    validates_format_of     :email, with: VALID_EMAIL_REGEX, allow_blank: true, if: :email_changed?
    validates               :email, length: {maximum: 255}

	validates_presence_of 	  :password, :on => :create
	validates_confirmation_of :password, :on => :create
	validates_length_of       :password, :within => Devise.password_length, allow_blank: true
	

	has_many :sent_invites, class_name: "FriendRequest", 
							foreign_key: "sender_id", 
							dependent: :destroy

	has_many :followings, through: :sent_invites, source: :receiver

	has_many :received_invites, class_name: "FriendRequest", 
								foreign_key: "receiver_id",
								dependent: :destroy
    
    has_many :followers, through: :received_invites, source: :sender 

    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships

    has_many :inverse_friendships, class_name: "Friendship", 
    							   foreign_key: "friend_id",
    							   dependent: :destroy
    has_many :inverse_friends, :through => :inverse_friendships,
    						   :source => :user
	
	has_many :posts, dependent: :destroy

	#like feature
	has_many :like_relationships, foreign_key: "admirer_id", dependent: :destroy
	has_many :likes, through: :like_relationships

	#comment feature
	has_many :comments, foreign_key: "author_id"
	
	#returns current_user and friend posts in reverse order
	def feed
		friend_ids = friends.collect { |e| e.id  } + inverse_friends.collect{|e| e.id}

		Post.where('user_id=? OR user_id IN (?)', id, friend_ids)
	end

	def friend?(other)
		friends.include?(other) || inverse_friends.include?(other)
	end

	def likes?(thing)
		likes.include?(thing)
	end

	def num_friends
		friends.count+inverse_friends.count
	end

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

			puts "****email: #{auth.info.email}"
			puts "****#{auth.extra.birthday}"
			puts "****#{auth.extra.locale}"
			user.email = auth.info.email
			user.birthdate = auth.extra.birthday
			user.skip_birthdate = true unless user.birthdate
			puts "^^^^^^^^^^^^^extra#{auth.extra}"
			puts "!!!!!!!!!#auth.info: #{auth.info}"
			user.password = Devise.friendly_token[0,20]
			user.name = auth.info.name # assuming the user model has a name
			#user.image = auth.info.image #assuming the user model has an image
			# If you are using confirmable and the provider(s) you use validate emails, 
    		# uncomment the line below to skip the confirmation emails.
    		# user.skip_confirmation!
		end
	end

end


