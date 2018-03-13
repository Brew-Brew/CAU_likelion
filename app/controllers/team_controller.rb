class TeamController < ApplicationController

  before_action :check_user_in_cau, only: [:secret]

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
  def secret

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

#cau 팀학생인지 check 한다.팀번호가 없으면 cau학생만 이용가능하다는 페이지로 이동한다.
def check_user_in_cau
  if user_signed_in?
    @user_team=current_user.team_id
    if([1,2,3].include? @user_team)
    else
        redirect_back(fallback_location: root_path)
    end
  end

end
