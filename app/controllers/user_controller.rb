class UserController < ApplicationController
protect_from_forgery with: :exception, prepend: true
  def index
  @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:user])
    @user.image = params[:image]
    @user.save
    redirect_back(fallback_location: root_path)
  end
end
