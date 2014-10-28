class NotificationsController < ApplicationController
	
	def create
		@notification=Notification.new(notif_params)

		if @notification.save
			redirect_to "/teams"
		else
			redirect_to "/notificationfailure"
		end

	end

	private

	def notif_params
		params.permit(:user_id, :team_id)
	end

end

#, :team_id, :invited_by_id, :message)