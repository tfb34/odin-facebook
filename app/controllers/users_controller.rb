class UsersController < ApplicationController
  before_action :require_logout , only: [:new]
  before_action :require_login , only: [:edit]

  #show all the users
  def index
    if name = params[:user_name]
      puts "****************" 
      @users = User.where("name ilike '%#{name}%'")
    else
  	   @users = User.all
    end
    @users = @users.paginate(page: params[:page], :per_page => 10)
  end
   
  def show
  	@user = User.find_by(id: params[:id])
    @posts = @user.posts.paginate(page: params[:page], :per_page => 10) 
  end

  def edit
    @user = User.find_by(id: params[:id])
    redirect_to root_path if @user.nil?
  end

#move the avatar stuff to registration controller
  def update
    @user = User.find_by(id: params[:id])
    @user.avatar.clear if params[:user][:delete_avatar]
    
    if @user.update_attributes(user_params)
      puts @user.avatar.present?
      flash.now[:success]= I18n.t 'devise.registrations.updated'
    end
    render 'edit'
  end

  private
  #UPDATE if adding other fields to the user profile
  #users that sign in with google+ accounts may edit only certain fields
  def user_params
  	#params.require(:user).permit(:name, :email,:birthdate)
    params.require(:user).permit(:name, :birthdate, :avatar)
  end


end
