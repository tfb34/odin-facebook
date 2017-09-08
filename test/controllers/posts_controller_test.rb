require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "create post only when signed in" do 
  
  	post posts_path(content: "Now, our joy, although our last and least, 
  							  to whose young love what can you say to draw 
  							  a third more opulent than your sisters'? Speak.")
  	assert_response :redirect

    sign_in users(:Buffy)
    assert_difference 'Post.count' do 
      post posts_path(post: {content: "Keeping tortoises as pets has been the 
                     only reliable way of estimating how long
                     they can live."})
    end
  end


end
