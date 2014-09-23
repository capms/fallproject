class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def index

  end
  def new
    @free_users = User.where(team_id: nil)
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end


end