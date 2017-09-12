require 'test_helper'

class LikeRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
  	@buffy = users(:Buffy)
  	@post = posts(:most_recent)
  	@liked = LikeRelationship.new(admirer_id: @buffy.id, like_id: @post.id)
  
  end

  test "should be valid" do 
  	assert @liked.valid?
  end

  test "admirer must be present" do 
  	@liked.admirer_id = nil
  	assert_not @liked.valid?
  end

  test "liked object must be present" do
  	@liked.like_id = nil
  	assert_not @liked.valid?
  end

  test "destroyed upon admirer no longer existing" do 
  	@liked.save
  	assert_difference 'LikeRelationship.count', -1 do 
  		@buffy.destroy
  	end
  end

  test "destroyed upon liked object no longer existing" do 
  	@liked.save
  	assert_difference 'LikeRelationship.count', -1 do 
  		@post.destroy
  	end
  end

 


end
