class PostsController < ApplicationController
  
  before_action :require_login
  #the index stuff should be in the user class
  #show current users post and friends post. so i gues join them and organize by date?
  #def index
    #all_posts = current_user.feed
   # @posts = current_user.feed.paginate(page: params[:page])
   # render 'static_pages/homepage'
  #end
  #create new post. User must submit text
  def create

  	@post = current_user.posts.build(content: params[:post][:content])
    
  	if @post.valid?
  		@post.save
  		flash[:notice] = "New post has been added."
  	else
  		flash[:error] = "Oops! Something went wrong. Post could not be added."
  	end
  	#depends where posts can be created 
  	#if only on the users page then render user page(must render partial with post/new form)

    #render 'static_pages/homepage'
    redirect_back(fallback_location: root_path)
  end

  def delete
  end
end
