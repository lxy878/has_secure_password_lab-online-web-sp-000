class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    binding.pry
    redirect_to root_path if !user.authenticate(params[:password])
    session[:user_id]=user.id
    redirect_to users_show_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
