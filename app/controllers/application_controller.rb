class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user
  before_action :require_login

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in to access this page."
    end
  end
end
