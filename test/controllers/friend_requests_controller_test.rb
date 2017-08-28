require 'test_helper'


class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers


	test "should be logged in before sending friend requests" do
		post friend_requests_path
		assert_redirected_to new_user_session_path
	end

	test "should send friend request successfully" do
		#login
		sign_in users(:Buffy)

		#send friend request
		other = users(:Charles)
		assert_difference 'FriendRequest.count' do 
			post friend_requests_path(params:{id: other.id})
		end
	end

	test "should not send duplicate friend requests" do 
		#login
		sign_in users(:Buffy)

		#send friend request
		other = users(:Charles)
		assert_difference 'FriendRequest.count' do 
			post friend_requests_path(params:{id: other.id})
		end

		#send duplicate friend request
		assert_no_difference 'FriendRequest.count' do 
			post friend_requests_path(params:{id: other.id})
		end
	end

	test "friend request may be cancelled by sender" do 
		# login
		sign_in users(:Buffy)
		#send friend request
		assert_difference 'FriendRequest.count' do
		post friend_requests_path(params:{id: users(:Charles).id})
	    end
		#cancel friend request
		assert_difference 'FriendRequest.count', -1 do 
			delete friend_request_path(id: users(:Charles).id)
		end
	end

end
