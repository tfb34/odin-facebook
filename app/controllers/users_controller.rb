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
    @posts = @user.posts.paginate(page: params[:page], :per_page => 10) 
  end

  def edit
    @user = User.find_by(id: params[:id])
    redirect_to root_path if @user.nil?
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success]= I18n.t 'devise.registrations.updated'
    else
      flash.now[:alert] = @user.errors.full_messages
    end
    render 'edit'
  end

  private
  #UPDATE if adding other fields to the user profile
  #users that sign in with google+ accounts may edit only certain fields
  def user_params
  	#params.require(:user).permit(:name, :email,:birthdate)
    params.require(:user).permit(:name, :birthdate)
  end


end
