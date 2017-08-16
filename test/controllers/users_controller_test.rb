require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:Buffy)
    @user.save
  end

  test "should get new" do
    get new_user_path
    assert_match 'Email', @response.body
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
    assert_match @user.email, @response.body
  end

  test "successful user creation" do 
    assert_difference 'User.count' do 
      post users_path, params: { user: {:name=>"Ragnor",
                                     :email=>"ragnarsson@example.com",
                                     :birthdate => Date.today - 30.years}
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
                                     :email=>"",
                                     :birthdate => Date.today - 30.years}
                            }
    end
    assert_match "danger", @response.body 
  end

  test "unsuccessful user update" do 
     patch user_path(@user), params: { user: {name: "",
                                              email: "summers@example",
                                              birthdate: @user.birthdate,
                                              }
                                      }
     assert_match "error", @response.body
  end

  test "successful user update" do 
     patch user_path(@user), params: { user: {name: @user.name,
                                              email: "summerslay@example.com",
                                              birthdate: @user.birthdate,
                                              }
                                      }
     assert_match "successfully", @response.body
  end

  test "successfully destroy user" do 
    assert_difference('User.count', -1) do 
      delete user_path(@user)
    end
    assert_redirected_to root_path
    assert_match "User profile was successfully deleted.", flash[:success]
  end

end
