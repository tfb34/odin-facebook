require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
#think about admin. only admin may post on their own page?
#friends and self can see each other's posts
#outsiders can't see squat
  def setup
  	@buffy = users(:Buffy)
  	@charles = users(:Charles)
  	@buffy.friends << @charles
  	@buffy.posts << posts(:sushi)
  	@charles.posts << posts(:ghost_bear)
  end

  test "should be signed in to see posts" do 
  	get user_path(@buffy)
  	assert_no_match posts(:sushi).content, @response.body
  end

  test "should see posts on friend's profile page when signed in" do 
  	  sign_in @charles 
  	  get user_path(@buffy)
  	  assert_match posts(:ghost_bear).content, @response.body
  end

  test "signed_in strangers should not see your posts feed" do
  	  #outsider should not see posts feed
  	  @non_friend = users(:Uhtred)
  	  sign_in @non_friend
  	  get user_path(@buffy)
  	  assert_no_match posts(:sushi).content, @response.body
  	  
  	  #friend should see posts feed
  	  sign_in @charles
  	  get user_path(@buffy)
  	  assert_match posts(:sushi).content, @response.body
  end

  test "post form should appear for authorized user only" do 
  	#not logged in, visits a profile
  	get user_path(@buffy)
  	assert_select "div.post_form", false 
  	#charles goes to buffy's page
  	#logged in, visits own profile
  	sign_in @buffy
  	get user_path(@buffy)
  	assert_select "div.post_form", true
    #logged in, visits someone else's profile
    sign_in @buffy
    get user_path(@charles)
    assert_select "div.post_form", false
  end

end
