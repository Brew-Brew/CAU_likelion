class TeamController < ApplicationController
  def index
    @teamid=params[:teamid]
    @users = User.where("team_id = ?", params[:teamid])
  end
end
