class TeamController < ApplicationController
  def index
    @teamid=params[:teamid]
    @users = User.where("team_id = ?", params[:teamid])
    @admins = @users.select { |user| user.roles.last.name == 'admin'}
    @students = @users.select { |user| user.roles.last.name == 'student'}
    # @admin = @users.roles.first.name == "admin"

  end

  def admin
    user = current_user
    user.add_role :admin # sets a global role
    redirect_back(fallback_location: root_path)
  end
  def student
    user = current_user
    user.add_role :student # sets a global role
    redirect_back(fallback_location: root_path)
  end

  def only_cau
    
  end

  def selectTeam
    @teamnum=params[:teamid]
    current_user.team_id = @teamnum
    current_user.save
    redirect_back(fallback_location: root_path)
  end
end
