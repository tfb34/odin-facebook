class LikeRelationshipsController < ApplicationController
  before_action :require_login

  #i wonder if require _login is called twice per call. 1 for determine action
  def create
  	#only signed in user may like something, current user
  	current_user.like_relationships.create(like_id: params[:object_id])
  	#@user = User.find_by(id: 3)
    @post = Post.find_by(id: params[:object_id])
    #redirect_back(fallback_location: root_path)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.js 
    end
  end

  def destroy

  	 @like_relationship = LikeRelationship.find_by(id: params[:id]).destroy
     @post = @like_relationship.like

  	 #@user = User.find_by(id: 3)
  	 #redirect_back(fallback_location: root_path)
     respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.js
     end
  end

  

end
