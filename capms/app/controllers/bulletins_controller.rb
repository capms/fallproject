class BulletinsController < ApplicationController
	#Creates bulletin
	def create
		if Bulletin.find_by(bullet_params).blank?
			@bullet=Bulletin.new(bullet_params)
			if @bullet.save
				redirect_to "/teams/"
			else
				redirect_to "/bulletfailure"
			end
		#else
			#flash[:notice] = "This user has already been invited to join your team"
			#redirect_to "/teams/"
		end
		

		

	end
	#destroys a bulletin
	def destroy
		@des_bullet=Bulletin.delete(params[:id])

		redirect_to "/teams/"
	end
	#Creates a bulletin for all users that there is a new message/comment
	def gen_after_msg
		@allUsers = User.all
		@allUsers.each do |u|
			Bulletin.new(user_id: u.id, message_id: params[:id]).save
		end
		redirect_to '/messages/'
	end
	#Destroys a bulletin that existed to notify user of new message/comment
	def destroy_msg_bull
		@bulls = Bulletin.where("user_id = ? AND message_id IS NOT NULL", params[:id])
		@bulls.each do |b|
			Bulletin.delete(b.id)
		end
		redirect_to '/messages/'
	end
	#Called when user requests to start the publication of a file. Sends bulletins to other users on team
	# and creates approval for user that requested publication
	def publish_request
		@thisTeam = Team.find(params[:team_id])
		@teamUsers = User.where(team_id: params[:team_id])
		@teamUsers.each do |u|
			if current_user.id != u.id
				Bulletin.new(user_id: u.id, invited_by_id: current_user.id, approval_pending: true).save
			end
		end
		@approval = Approval.new(user_id: current_user.id, file_url: params[:file_url]).save
		redirect_to "/teams/#{current_user.team_id}"
	end

	#Called when user agrees to publish file. Creates approval for current user and delete bulletin.
	def publish_agree
		@bulletinToDestroy = Bulletin.find_by(user_id: current_user.id, approval_pending: true)
		Bulletin.destroy(@bulletinToDestroy.id)
		@newApproval = Approval.new(user_id: current_user.id, file_url: params[:file_url]).save
		redirect_to "/teams/#{current_user.team_id}"
	end

	#Called when user declines to publish file. Deletes all approvals for that file and an approval bulletin for each user.
	def publish_decline
		@thisTeam = Team.find(params[:team_id])
		@teamUsers = User.where(team_id: params[:team_id])
		@teamUsers.each do |u|
			aBulletin = Bulletin.find_by(user_id: u.id, approval_pending: true)
			anApproval = Approval.find_by(user_id: u.id, file_url: params[:file_url])
			if  anApproval == nil
				Bulletin.destroy(aBulletin.id)
			end
		end
		@allApprovals = Approval.where(file_url: params[:file_url])
		@allApprovals.each do |a|
			Approval.destroy(a)
		end
		redirect_to "/teams/#{current_user.team_id}"
	end

	private

	def bullet_params
		params.permit(:user_id, :team_id, :invited_by_id, :new_message)
	end

end
