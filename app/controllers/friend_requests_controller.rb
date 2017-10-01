class FriendRequestsController < ApplicationController
  before_action :require_login

  def index
  end

  def create
  	@friend_request = current_user.sent_invites.build(receiver_id: params[:id])
  	if @friend_request.save
  		flash[:notice] = "Friend request was successfully sent."
  	else
  		flash[:error] = "Unable to send friend request." 
  	end
  	#@users = User.all
    #@user = current_user
  	#render 'users/index'
    redirect_back fallback_location: root_path
  end

  #cancel friend request
  def destroy
    #find friend request. The person who created the friend request can only delete it
    @friend_request = current_user.sent_invites.find_by(receiver_id: params[:id])
    if @friend_request
      @friend_request.destroy
      flash[:notice] = "Friend request was successfully cancelled."
    else
      flash[:error] = "Friend request not found."
    end
    #where to redirect or what to render?
    #code here
    redirect_back fallback_location: root_path
  end

end
