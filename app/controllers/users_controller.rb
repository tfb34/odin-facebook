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
  	@user.birthdate = get_date
  	if @user.save
  		flash[:success] = "User was successfully created."
  		redirect_to @user 
  	else
  		flash.now[:danger] = @user.errors.full_messages
  		render 'new'
  	end
  end

  #delete user and redirect to homepage
  def delete
  end

  #show user profile
  def show
  	@user = User.find_by(id: params[:id])
  end

  #return form for specific user
  def edit
  end

  #update attributes using the edit form returned, return to profile
  def update
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email)
  end

  def get_date
  	date = params[:date]
  	Date.new(date[:year].to_i, date[:month].to_i, date[:day].to_i)
  end


end
