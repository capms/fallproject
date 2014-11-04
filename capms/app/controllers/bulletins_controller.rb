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

	private

	def bullet_params
		params.permit(:user_id, :team_id, :invited_by_id)
	end

end
