require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  
  def setup
  	@friendrequest = FriendRequest.new(sender_id: users(:Buffy).id, receiver_id: users(:Charles).id)
  end

  test "should be valid" do 
  	assert @friendrequest.valid?
  end

  test "should require a sender_id" do 
  	@friendrequest.sender_id = nil
  	assert_not @friendrequest.valid?
  end

  test "should require a receiver_id" do 
  	@friendrequest.receiver_id = nil
  	assert_not @friendrequest.valid?
  end

  test "should not be able to send duplicate friend requests" do 
  	@friendrequest2 = @friendrequest.dup
  	@friendrequest.save

  	assert_not @friendrequest2.valid?
  end

end
