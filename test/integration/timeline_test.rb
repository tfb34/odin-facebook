require 'test_helper'

class TimelineTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
  	@buffy = users(:Buffy)
  	@charles = users(:Charles)
  	@buffy.friends << @charles
  	@buffy.posts << posts(:sushi)
  	@charles.posts << posts(:ghost_bear)
  end

  test "should be signed in to see timeline" do 
  	get posts_path
  	assert_response :redirect

  	sign_in @buffy
  	get posts_path
  	assert_response :success
  end

  test "should show both current user's and friend posts" do 
  	sign_in @charles
  	get posts_path
  	#current user's post
  	assert_match posts(:ghost_bear).content, @response.body
  	#friend's post
  	assert_match posts(:sushi).content, @response.body
  end
end
