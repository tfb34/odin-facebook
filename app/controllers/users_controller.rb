class UsersController < ApplicationController
  before_action :require_logout , only: [:new]
  #show all the users
  def index
  	@users = User.all
  end
   
  #return form for user to fill out
  def new
  	@user = User.new
  end

#NO LONGER NEEDED; taken care by devise modules
  #create new user and redirect to profile
 
#NO LONGER NEEDED
  #delete user and redirect to homepage

#No longer needed , update action

  #show user profile
  #different permissions. current_user may comment and see their posts. friend may see their posts, otherwise, see nothing but a friend request link
  def show
  	@user = User.find_by(id: params[:id])
    #user is found
    @posts = @user.feed.paginate(page: params[:page], :per_page => 10)
    
    #may want to obtain posts here
  end


  private

  def user_params
  	params.require(:user).permit(:name, :email,:birthdate)
  end


end
