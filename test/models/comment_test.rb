require 'test_helper'

class CommentTest < ActiveSupport::TestCase
def setup 
  	@comment = Comment.new(author_id: users(:Buffy).id, 
  						   post_id: posts(:sushi).id, 
  						   content: "so delicious!")
  end

  test "should be valid" do
  	assert @comment.valid?
  end

  test "author should be present" do 
  	@comment.author_id = nil
  	assert_not @comment.valid?
  end

  test "post should be present" do 
  	@comment.post_id = nil
  	assert_not @comment.valid?
  end

  test "content should be present" do 
  	@comment.content = ""
  	assert_not @comment.valid?
  end

  #test "destroyed when author is terminated" do 

  #end

  #test "destroyed when post is destroyed" do 

  #end
end
