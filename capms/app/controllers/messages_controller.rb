class MessagesController < ApplicationController

	#displays all the messages
	def index
  		@message = Message.all
	end

	#creates a new message
	def new
		 @message = Message.new
	end

	#shows specific messages according to the id
	def show
  		@message = Message.find(params[:id])
	end

	#creates a new message
	def create
		p message_params
		@message = Message.new(message_params)
 		if @message.save
    		@allUsers = User.all
			@allUsers.each do |u|
				if u.id != current_user.id
					Bulletin.new(user_id: u.id, message_id: @message.id).save
				end
			end
			redirect_to '/messages/'
  		else
    		render 'new'
  		end
	end

	def edit
	  	@message = Message.find(params[:id])
	end

	def update
	  	@message = Message.find(params[:id])
	 
	 	#if the message update contains the message_params then go through 
	  	if @message.update(message_params)
	  		@allUsers = User.all
			@allUsers.each do |u|
				#if user id does not equal current user id then make a new bulletin
				if u.id != current_user.id
					Bulletin.new(user_id: u.id, message_id: @message.id).save
				end
			end
	    	redirect_to @message
	 	 else
	    	render 'edit'
	  	end
	end

	def destroy
	  	@message = Message.find(params[:id])
	  	@message.destroy
	 
	  	redirect_to messages_path
	end

	private
  		def message_params
    		params.require(:message).permit(:title, :text, :author_id)
  		end


end
