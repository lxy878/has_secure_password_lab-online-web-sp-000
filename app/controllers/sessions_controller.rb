class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if !user.authenticate(params[:user][:password])
      redirect_to root_path
    else
      session[:user_id]=user.id
      redirect_to users_show_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
