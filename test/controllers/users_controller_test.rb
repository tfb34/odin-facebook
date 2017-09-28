require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
  	@user = users(:Buffy)
  end

  #test "should get new" do
   # get new_user_path
   # assert_match 'Email', @response.body
   # assert_response :success
  #end

  #test "should NOT get new when logged in" do 
   # sign_in @user
   # get new_user_path
    #assert_response :redirect
  #end

  test "should get index" do 
  	get users_path
  	assert_response :success
    assert_match @user.name, @response.body
    assert_match users(:Charles).name, @response.body
  end

  test "should show user" do
  	get user_path(@user)
  	assert_response :success
  end

  test "successful user creation" do 
    assert_difference 'User.count' do 
      post user_registration_path, params: { user: {:name=>"Ragnor",
                                     :email=>"ragnarsson@example.com",
                                     :birthdate => Date.today - 30.years,
                                     :password => "password",
                                     :password_confirmation => "password"}
                            }
    end
    #redirected twice. devise by default redirects to homepage. require_logout redirects to user's homepage
    follow_redirect!
    follow_redirect!
    assert_match "Welcome! You have signed up successfully.", @response.body
  end

 



end
