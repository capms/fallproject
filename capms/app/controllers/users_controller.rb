class UsersController < ApplicationController

  def index

  end

  def show
      @user = User.find(params[:id])
      @acceptableUser = AcceptableUser.new
  end

  def new

  end

  def create

  end

  def edit

  end

  def update
      @updateUser = User.find(params[:id])
      @bulletin = Bulletin.find(params[:notif_id])
      if @updateUser.update_attributes(:team_id => params[:team_id])
        @bulletin.destroy
        redirect_to "/teams/"
      else
        redirect_to "/404/"
      end
  end

  def destroy
      @destroyUser = User.delete(params[:id])
      redirect_to ("/users/#{params[:adminid]}")
  end
  def change_team
      @changeTeamUser = User.find(params[:id])
      if @changeTeamUser.update_attributes(:team_id => nil)
        redirect_to("/users/#{current_user.id}")
      else
        redirect_to "/404/"
      end
  end

end