class UsersController < ApplicationController

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
      @updateUser = User.find(params[:id])
      @notification = Notification.find(params[:notif_id])
      if @updateUser.update_attributes(:team_id => params[:team_id])
        @notification.destroy
        redirect_to "/teams/"
      else
        redirect_to "/404/"
      end
  end

end