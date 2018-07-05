class PostsController < ApplicationController
  
  before_action :require_login

  def index
     @posts = current_user.feed.paginate(page: params[:page], :per_page => 10)
  end
 
  def create
  	@post = current_user.posts.build(post_params)
   
  	if @post.valid?
  		@post.save
    puts call
  		flash[:notice] = "New post has been added."
  	else
  		flash[:error] = "Empty post could not be added."
  	end
  	#depends where posts can be created 
  	#if only on the users page then render user page(must render partial with post/new form)

    #render 'static_pages/homepage'
    redirect_back(fallback_location: root_path)
  end

  def delete
  end

  private

  def post_params
     params.require(:post).permit(:content, :picture)
  end

end
