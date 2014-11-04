class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :semester, :phone, :resume_url, :about_me, :linkedin_url, :user_type, :team_id, :picture_url, :email, :password, :password_confirmation)
    end
  end

end
