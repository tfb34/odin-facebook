class FriendshipsController < ApplicationController
  
  before_action :require_login

  def index
  end

  def create

  	if (@invite = current_user.received_invites.find_by(sender_id: params[:id])) && (@friendship = current_user.friendships.build(friend_id: params[:id])) 
  		@friendship.save
	    @invite.destroy 
	    flash.now[:notice] = "Added friend."
  	else
  	    flash.now[:error] = "Unable to add friend."
  	end
  	render 'friend_requests/index'
  end

  #Remove friend
  def destroy
  	#find friendship
  	@friendship = current_user.friendships.find_by(friend_id: params[:id])
  	if @friendship ||= current_user.inverse_friendships.find_by(user_id: params[:id])
  		#destroy
  		@friendship.destroy
  		flash[:notice]= "Removed friend"
  	else
  		flash[:error] = "You are no longer friends."
  	end
    
  	redirect_back fallback_location: root_path
  end


end
