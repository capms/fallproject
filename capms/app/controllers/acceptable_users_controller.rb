class AcceptableUsersController < ApplicationController

	def create
		#p "??" * 100
		#p params

		#params[:id_array].to_a.each do |i|

		@acceptableUser = AcceptableUser.new(acceptable_params)
		
		if @acceptableUser.save
			redirect_to(:back)
		else
			redirect_to "/404/"
		end
		
		#redirect_to "/users/#{current_user.id}"
		#redirect_to "/teams/"
	end

	private
	def acceptable_params
    	params.require(:acceptable_user).permit(:user_id, :added_by)
 	 end
end
