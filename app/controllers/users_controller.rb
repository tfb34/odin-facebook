class UsersController < ApplicationController
  #show all the users
  def index
  	@users = User.all
  end
   
  #return form for user to fill out
  def new
  	@user = User.new
  end

  #create new user and redirect to profile
  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:success] = "User was successfully created."
  		redirect_to @user 
  	else
  		render 'new'
  	end
  end

  #delete user and redirect to homepage
  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
       flash[:success] = "User profile was successfully deleted."
       redirect_to root_path
    end

  end

  #show user profile
  def show
  	@user = User.find_by(id: params[:id])
  end

  #return form for specific user
  def edit
    @user = User.find_by(id: params[:id])
  end

  #update attributes using the edit form returned, return to profile
  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Your profile has been successfully updated"
    end
    render 'edit'
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email,:birthdate)
  end


end
