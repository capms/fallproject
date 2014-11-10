class TeamsController < ApplicationController
  def index
    @all_users = User.all
    @all_teams = Team.all
    @free_users = User.where(team_id: nil)
    @team = Team.new
    #@notification = Notification.new
  end

  def new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      render "index"
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @desTeam = Team.find(params[:id])
    @usersInTeam = User.where(team_id: @desTeam.id)
    @usersInTeam.each  do |u|
      u.update_attribute(:team_id, nil)
    end

    Team.delete(@desTeam.id)

    redirect_to (:back)
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :max_size)
  end

end
