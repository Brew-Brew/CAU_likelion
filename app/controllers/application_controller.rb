class ApplicationController < ActionController::Base
  layout "application"
  protect_from_forgery with: :exception, prepend: true
   skip_before_action :verify_authenticity_token ,raise: false
  #아래 부분은 devise 에 name,teamid를 추가하여 등록하기 위해 추가된 부분이다.
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :team_id) }
  # end
end
