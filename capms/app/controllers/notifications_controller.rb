class NotificationsController < ApplicationController
	
	def create
		if Notification.find_by(notif_params).blank?
			@notification=Notification.new(notif_params)
			if @notification.save
				redirect_to "/teams/"
			else
				redirect_to "/notificationfailure"
			end
		else
			flash[:notice] = "This user has already been invited to join your team"
			redirect_to "/teams/"
		end
		##Add else that lets user know somehow that this person has already by invited to team

		

	end

	def destroy
		@des_notif=Notification.delete(params[:id])

		redirect_to "/teams/"
	end

	private

	def notif_params
		params.permit(:user_id, :team_id)
	end

end

#, :team_id, :invited_by_id, :message)