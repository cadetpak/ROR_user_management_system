class UsersController < ApplicationController
  def index
  	#creates @users variable that holds data for User model
  	@users = User.all
  	# automatically loads index.html.erb
  end 

  # when user clicked 'create new user'
  def new
    #automatically loads new.html.erb
  end

  #action to create new user
  def create
  	@user = User.new(user_params)
  	if @user.save
  	  redirect_to action: 'index'
  	else
  	  #flash[:errors] is available in views/layouts/application.html.erb 
  	  #this allows flash[:errors] to be accessible across web app instead of repeating code
  	  flash[:errors] = @user.errors.full_messages
  	  #not too sure of this, but looks like controllers users, action new
  	  redirect_to users_new_path
  	end
  end

  # when user clicks 'show' for each user
  def show
  	# the params[:id] is passed in from URL
  	@user = User.find(params[:id])
  	#automatically loads show.html.erb
  end

  # when user clicks 'edit' for each user
  def edit
  	#the params[:id] is passed in from URL
  	@user = User.find(params[:id])
  	#automatically loads edit.html.erb
  end 

  #action to update user info
  def update
  	# the params[:id] is passed in from URL, user_params is the private method below
  	User.update(User.find(params[:id]), user_params)
  	redirect_to '/'
  end

  #action to delete user
  def destroy
  	# the params[:id] is passed in from URL
  	User.find(params[:id]).destroy
  	redirect_to '/'
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email_address, :password)
  end

end