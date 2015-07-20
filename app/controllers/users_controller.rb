class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to user_path
  end

  def show

  end

  def edit
  end

  def destroy
  end

  def update
  end




  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
   params.require(:user).permit(:status)
  end
end
