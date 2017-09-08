module ApplicationHelper
	
  private
  #used by friendships and friend_requests controllers
  def require_login
  	redirect_to new_user_session_path if !user_signed_in?
  end

  def require_logout
  	redirect_to user_path(current_user) if signed_in?
  end

end
