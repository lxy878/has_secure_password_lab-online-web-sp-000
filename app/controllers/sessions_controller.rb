class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
  end

  def destroy
  end

end
