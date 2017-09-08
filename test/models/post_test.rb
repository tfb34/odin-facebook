require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@post = Post.new(user_id: users(:Buffy).id, content: "Mr. Bingley was good-looking and gentlemanlike; 
  														  he had a pleasant countenance, and easy, unaffected 
  														  manners. His sisters were fine women, with an air of
  														  decided fashion.")
  end

  test "should be valid" do 
  	assert @post.valid?
  end

  test "author must be present" do 
  	@post.user_id = nil
  	assert_not @post.valid?
  end

  test "content should be present" do 
  	@post.content = nil
  	assert_not @post.valid?
  end

  test "order of posts should be most recent first" do 
  	assert_equal posts(:most_recent), Post.first
    
  end
end
