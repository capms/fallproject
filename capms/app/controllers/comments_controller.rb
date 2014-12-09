class CommentsController < ApplicationController

	def create
    	@message = Message.find(params[:message_id])
   		@comment = @message.comments.create(comment_params)
      @allUsers = User.all
      #loop through all users
      @allUsers.each do |u|
        #if user id is not equal to current user id then make a new bulletin
        if u.id != current_user.id
          Bulletin.new(user_id: u.id, message_id: @message.id).save
        end
      end
      #redirect to the correct message
   	 	redirect_to message_path(@message)
  	end

  	def destroy
      #find the message params and the find the comment params and destroy comment
	    @message = Message.find(params[:message_id])
	    @comment = @message.comments.find(params[:id])
	    @comment.destroy
	    redirect_to message_path(@message)
	  end
 
  	private
    	def comment_params
      	params.require(:comment).permit(:commenter, :body, :commenter_id)
    end
end
