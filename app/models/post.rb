class Post < ApplicationRecord
  belongs_to :user

  default_scope {order(created_at: :desc)}
  validates :content, presence: true, unless: :picture_present?

  def picture_present?
  	picture.present?
  end 

  has_many :like_relationships, foreign_key: "like_id", dependent: :destroy
  has_many :admirers, through: :like_relationships

  has_many :comments

  #has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  
  #paperclip
  has_attached_file :picture, styles: {medium: "300x300>", thumb: "100x100>"}, 
                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
