class BulletinsController < ApplicationController

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
		##Add else that lets user know somehow that this person has already by invited to team

		

	end

	def destroy
		@des_bullet=Bulletin.delete(params[:id])

		redirect_to "/teams/"
	end

	def gen_after_msg
		@allUsers = User.all
		@allUsers.each do |u|
			Bulletin.new(user_id: u.id, message_id: params[:id]).save
		end
		redirect_to '/messages/'
	end

	def destroy_msg_bull
		@bulls = Bulletin.where("user_id = ? AND message_id IS NOT NULL", params[:id])
		@bulls.each do |b|
			Bulletin.delete(b.id)
		end
		redirect_to '/messages/'
	end
	
	private

	def bullet_params
		params.permit(:user_id, :team_id, :invited_by_id, :new_message)
	end

end
