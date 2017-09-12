class Post < ApplicationRecord
  belongs_to :user

  default_scope {order(created_at: :desc)}
  validates :content, presence: true

  has_many :like_relationships, foreign_key: "like_id", dependent: :destroy
  has_many :admirers, through: :like_relationships
end
