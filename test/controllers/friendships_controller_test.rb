require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
 # test "should get create" do
  #  post friendships_url
  #  assert_response :success
 # end
  include Devise::Test::IntegrationHelpers

  test "should delete friendship" do 
  	sign_in users(:Buffy)
  	#send friend request
  	assert_difference 'FriendRequest.count' do
  		post friend_requests_path(params: {id: users(:Charles).id})
  	end

  	sign_out :user
  	sign_in users(:Charles)
  	#add friend
  	assert_difference 'Friendship.count' do 
  		post friendships_path(params: {id: users(:Buffy).id})
  	end
  	#destroy friendship
  	assert_difference 'Friendship.count', -1 do 
  		delete friendship_path(id: users(:Buffy).id)
  	end

  end

end
