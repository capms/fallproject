class TeamsController < ApplicationController
  def index
    @all_users = User.all
    @all_teams = Team.all
    @free_users = User.where(team_id: nil)
    @team = Team.new
  end

  def new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      render "new"
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
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :max_size)
  end

end
