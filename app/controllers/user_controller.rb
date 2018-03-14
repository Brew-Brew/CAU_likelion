class UserController < ApplicationController
protect_from_forgery
skip_before_action :verify_authenticity_token
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
