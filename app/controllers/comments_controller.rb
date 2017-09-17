class CommentsController < ApplicationController

  def index
    @post_id = params[:post_id]
    @comments = Post.find_by(id: @post_id).comments
  end
  
  def new
  	#the form needs a post object or id at least instance variable
  	@post_id = params[:post_id]
  	respond_to do |format|
  		format.html {redirect_back(fallback_location: root_path)}
  		format.js
  	end
  end


  def create
    @post_id = params[:post_id]
  	@comment = current_user.comments.build(content: params[:comment][:content], post_id: @post_id)
  	@comment.save if @comment.valid?

    #will be used to update show_comments ajax thing maybe
    @comments = Post.find_by(id: @post_id).comments

  	respond_to do |format|
  		format.html {redirect_back(fallback_location: root_path)}
  		format.js
  	end
  end

  def cancel
    @post_id = params[:post_id]
    respond_to do |format|
      format.html {redirect_back(fallback_location:root_path)}
      format.js
    end
  end


end 
