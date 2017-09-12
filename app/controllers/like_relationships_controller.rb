class LikeRelationshipsController < ApplicationController
  before_action :require_login, only: [:determine_action]
  before_action :determine_action
  #i wonder if require _login is called twice per call. 1 for determine action
  def create
  	#only signed in user may like something, current user
  	
  	@liked = current_user.like_relationships.create(like_id: params[:object_id])
  	@user = User.find_by(id: params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
  	 @liked.destroy if @liked
  	 @user = User.find_by(id: params[:user_id])
  	 redirect_back(fallback_location: root_path)
  end

  private

  def determine_action
  	if @liked = LikeRelationship.find_by(admirer_id: current_user.id, like_id: params[:object_id])
  		destroy
  	else
  		create
  	end
  end

end
