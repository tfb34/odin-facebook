require 'test_helper'

class AcceptingFriendRequestTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
  	@user1  = users(:Buffy)
  	@user2 = users(:Charles)
  end

  test "should be able to add friend upon receiving a friend invite" do 
  	#login user1
  	sign_in @user1
  	#send an invite to another user
  	assert_difference 'FriendRequest.count' do 
  		post friend_requests_path, params: {id: @user2.id}
  	end
  	#logout user
  	sign_out @user1
  	#login user2
  	sign_in @user2
  	#check if there is an invite by user1
  	get friend_requests_path
  	assert_response :success
  	assert_match @user1.name, @response.body
  	#accept invite
  	assert_difference '@user2.friends.count' do
  		post friendships_path, params:{ id: @user1.id}
  	end

  end

  
end
