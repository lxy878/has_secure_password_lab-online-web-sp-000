class UsersController < ApplicationController
  before_action :authentication, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def authentication
      redirect_to root_path if !session.include? :user_id
    end
end
