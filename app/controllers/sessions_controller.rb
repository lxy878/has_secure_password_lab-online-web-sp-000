class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    # redirect_to '/' if @user
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

end
