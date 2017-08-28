require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
  	@user = User.new(name: "Example User",
  					 email: "user@example.com",
  					 birthdate: Date.today,
             password: "password")
  end

  test "should be valid" do 
  	assert @user.valid?
  end

  test "name should be present" do 
  	@user.name = ""
  	assert_not @user.valid?
  end

  test "name should not be too long" do 
  	@user.name = "a"*71
  	assert_not @user.valid?
  end

  test "email should be present" do 
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "email should not be too long" do 
  	@user.email = "a"*244+"@example.com"
  	assert_not @user.valid?
  end 

  test "email validation should accept valid addresses" do 
  	invalid_addresses = %w[sushi@example sammy@gmail,com benjamin_anna@yahoo+gmail.com]
	invalid_addresses.each do |address|
		@user.email = address
		assert_not @user.valid?, "#{address.inspect}, give me an invalid address"
	end
  end

  test "birthdate should be present" do 
  	@user.birthdate = nil
  	assert_not @user.valid?
  end

  test "email should be unique" do 
  	@user2 = @user.dup
  	@user2.email = @user2.email.upcase
  	@user.save
  	assert_not @user2.valid?
  end

  test "should destroy dependent objects" do 
    #save user
    @user = users(:Buffy)
    @user2 = users(:Charles)
    
    @user.sent_invites.build(receiver_id: @user2.id).save
    
    assert_difference 'FriendRequest.count', -1 do
      @user.destroy
    end

    @user.friendships.build(friend_id: @user2.id).save

    assert_difference 'Friendship.count', -1 do 
      @user2.destroy
    end
    
  end


end
