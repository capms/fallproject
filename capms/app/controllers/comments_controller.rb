class CommentsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "secret", only: :destroy

	def create
    	@message = Message.find(params[:message_id])
   		@comment = @message.comments.create(comment_params)
      @allUsers = User.all
      @allUsers.each do |u|
        if u.id != current_user.id
          Bulletin.new(user_id: u.id, message_id: @message.id).save
        end
      end
   	 	redirect_to message_path(@message)
  	end

  	def destroy
	    @message = Message.find(params[:message_id])
	    @comment = @message.comments.find(params[:id])
	    @comment.destroy
	    redirect_to message_path(@message)
	  end
 
  	private
    	def comment_params
      	params.require(:comment).permit(:commenter, :body)
    end
end
