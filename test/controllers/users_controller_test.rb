require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = @user = User.new(name: "Teresa", email: "sushi@gmail.com", birthdate: Date.today)
  	@user.save
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get index" do 
  	get users_path
  	assert_response :success
  end

  test "should get show" do 

  	get user_path(@user.id)
  	assert_response :success
  end

  test "should get edit" do 
  	get edit_user_path(@user.id)
  	assert_response :success
  end


end
