class UsersController < ApplicationController
  #show all the users
  def index
  	@users = User.all
  end
   
  #return form for user to fill out
  def new
  end

  #create new user and redirect to profile
  def create
  end

  #delete user and redirect to homepage
  def delete
  end

  #show user profile
  def show
  end

  #return form for specific user
  def edit
  end

  #update attributes using the edit form returned, return to profile
  def update
  end


end
