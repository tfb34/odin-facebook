class FriendRequestsController < ApplicationController
  before_action :require_login

  def create
  	@friend_request = current_user.sent_invites.build(receiver_id: params[:id])
  	if @friend_request.save
  		flash.now[:info] = "Friend request was successfully sent."
  	else
  		flash.now[:warning] = "Unable to send friend request." 
  	end
  	@users = User.all
  	render 'users/index'
  end

  def destroy
  end

  private

  def require_login
  	redirect_to new_user_session_path if !user_signed_in?
  end
end
