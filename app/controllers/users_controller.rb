class UsersController < ApplicationController
  before_action :require_login, :only => [:edit, :destroy]
  before_action :require_current_user, :only => [:edit, :update, :destroy]
  # before_create :generate_token

  def show
    @user = current_user
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      sign_in(@user)  # <<<<<<<
      flash[:success] = "Created new user!"
      redirect_to root_path
    else
      flash.now[:error] = "Failed to Create User!"
      redirect_to user_path(current_user)
    end
  end

  def update
    if current_user.update(whitelisted_user_params)  # <<<<<
      flash[:success] = "Updated User"
      redirect_to current_user
    else
      flash[:error] = "Failed to update user"
      render :edit
    end
  end

  def destroy
  end

  private


  def whitelisted_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
