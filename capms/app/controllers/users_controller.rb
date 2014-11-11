class UsersController < ApplicationController
  # before_filter :configure_permitted_parameters

  def index

  end

  def show
      @user = User.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update
    p "1" *100
      @updateUser = User.find(params[:id])
      @notification = Notification.find(params[:notif_id])
      if @updateUser.update_attributes(:team_id => params[:team_id])
        @notification.destroy
        redirect_to "/teams/"
      else
        redirect_to "/404/"
      end
  end
  protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) do |u|
  #     u.permit(:first_name, :last_name,
  #       :email, :password, :password_confirmation)
  #   end
  #   devise_parameter_sanitizer.for(:account_update) do |u|
  #     u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :profilepicture, :semester, :phone, :resume_url, :about_me, :linkedin_url, :user_type, :team_id)
  #   end
 

  def user_params
    params.require(:user).permit(:profilepicture)
    params.require(:user).permit(:resume)
  end

end