class UsersController < ApplicationController
  # before_filter :configure_permitted_parameters

  def index

  end

  def show
      @user = User.find(params[:id])
      @acceptableUser = AcceptableUser.new
  end

  def new

  end
  #Creates a user
  def create
    #@industryUser = User.new(first_name: 'Your first name', last_name: 'Your last name', email: params[:email], password: params[:password], user_type_id: 3)
    @industryUser = User.new(indus_params)
    if @industryUser.save
      redirect_to (:back)
    else
      redirect_to "/404/"
    end
  end

  def edit

  end
  #Updates a user's team_id attribute if they accept a team invite. Also deletes the bulletin that
  # alerted the user that there was a team invite waiting for them
  def update
      @updateUser = User.find(params[:id])
      @bulletin = Bulletin.find(params[:bullet_id])
      newTeam = Team.find(params[:team_id])

      User.where(team_id: newTeam.id).each do |u|
        Bulletin.destroy_all(user_id: u.id, approval_pending: true)
        Approval.destroy_all(user_id: u.id)
      end

      if @updateUser.update_attributes(:team_id => params[:team_id])
        @bulletin.destroy
        redirect_to "/teams/"
      else
        redirect_to "/404/"
      end
  end
  #Changes the user's team_id back to nil, effectively leaving that team and now an available user.
  #  Deletes team if no users left on team
  def leave_team
    @mutineer = User.find(params[:id])
    previousTeam = @mutineer.team_id
    usersOnOldTeam = User.where(team_id: previousTeam)

    usersOnOldTeam.each do |u|
        Bulletin.destroy_all(user_id: u.id, approval_pending: true)
        Approval.destroy_all(user_id: u.id)
    end

    if @mutineer.update_attributes(:team_id => nil)
      if User.find_by(team_id: previousTeam) == nil
        Team.destroy(previousTeam)
        redirect_to "/teams/"
      else
        redirect_to "/teams/#{previousTeam}"
      end
      #redirect_to "/teams/"
    else
      redirect_to "/failure_page"
    end
  end
  #Called when a user leaves a team and deletes appropriate bulletins from them and approvals by them.
  #  Deletes team if no users left on team
  def change_team
      @changeTeamUser = User.find(params[:id])
      oldTeam = Team.find(@changeTeamUser.team_id)
      usersOnOldTeam = User.where(team_id: oldTeam.id)
      usersOnOldTeam.each do |u|
        Bulletin.destroy_all(user_id: u.id, approval_pending: true)
        Approval.destroy_all(user_id: u.id)
      end

      if @changeTeamUser.update_attributes(:team_id => nil)
        if User.find_by(team_id: oldTeam.id) == nil
          Team.destroy(oldTeam.id)
        end
        redirect_to("/users/#{current_user.id}")
      else
        redirect_to "/404/"
      end

  end
  #Destroys user
  def destroy
      @userToDestroy = User.find(params[:id])
      if @userToDestroy.team_id != nil
        usersOnOldTeam = User.where(team_id: @userToDestroy.team_id)
        usersOnOldTeam.each do |u|
          Bulletin.destroy_all(user_id: u.id, approval_pending: true)
          Approval.destroy_all(user_id: u.id)
        end
      end
      @destroyUser = User.delete(params[:id])
      redirect_to ("/users/#{params[:adminid]}")
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

  def indus_params
    params.require(:user).permit(:email, :password, :user_type_id)
  end


end