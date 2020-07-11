class UsersController < ApplicationController
  before_action :authentication, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(name: current_user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def authentication
      redirect_to root_path if !session.include? :name
    end
end
