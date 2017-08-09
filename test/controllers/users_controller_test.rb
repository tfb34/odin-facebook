require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = User.first
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get index" do 
  	get users_path
  	assert_response :success
  end

  test "should show user" do
  	get user_path(@user)
  	assert_response :success
  end

  test "should get edit" do 
  	get edit_user_path(@user.id)
  	assert_response :success
  end

  test "successful user creation" do 
    assert_difference 'User.count' do 
      post users_path, params: { user: {:name=>"Ragnor",
                                     :email=>"ragnarsson@example.com"},
                              date: {:year=>"1975",
                                     :month=>"12",
                                     :day=>"17"}
                            }
    end
    assert_redirected_to user_path(User.last)
    follow_redirect!
    assert_equal 'User was successfully created.', flash[:success]
    assert_match "User was successfully created.", @response.body
  end

  test "unsuccessful user creation" do 
    assert_no_difference 'User.count' do 
       post users_path, params: { user: {:name=>"Ragnor",
                                     :email=>""},
                              date: {:year=>"1975",
                                     :month=>"12",
                                     :day=>"17"}
                            }
    end
    assert_match "danger", @response.body 
  end


end
