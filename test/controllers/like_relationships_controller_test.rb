require 'test_helper'

class LikeRelationshipsControllerTest < ActionDispatch::IntegrationTest
  #check for strangers liking something. interface has that covered though
  include Devise::Test::IntegrationHelpers

  def setup
  	@buffy = users(:Buffy)
  	@post = posts(:most_recent)
  end

  test "should be able to like and unlike" do 
  	sign_in @buffy
  	assert_difference 'LikeRelationship.count' do 
  		post like_relationships_path(object_id: @post.id)
  	end

  	assert_difference 'LikeRelationship.count', -1 do 
  		post like_relationships_path(object_id: @post.id)
  	end
  end



end
