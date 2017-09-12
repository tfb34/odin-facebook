class LikeRelationship < ApplicationRecord
	belongs_to :admirer, :class_name => "User"
	belongs_to :like, :class_name => "Post"
end
