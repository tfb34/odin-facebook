require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
  	@friendship = Friendship.new(user_id: users(:Buffy).id, friend_id: users(:Charles).id)
  end

  test "should be valid" do
  	assert @friendship.valid?
  end

  test "should require a user_id" do 
  	@friendship.user_id = nil
  	assert_not @friendship.valid?
  end

  test "should require a friend_id" do 
  	@friendship.friend_id = nil
  	assert_not @friendship.valid?
  end 

  test "should not allow duplicate friendships" do 
  	@friendship2 = @friendship.dup 
  	@friendship.save
  	assert_not @friendship2.valid?
  end

end
