class MessagesController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show, :new] 

	def index
  		@message = Message.all
	end

	def new
		 @message = Message.new
	end

	def show
  		@message = Message.find(params[:id])
	end

	def create
		p message_params
		@message = Message.new(message_params)
 
 		if @message.save
    		redirect_to messages_path
  		else
    		render 'new'
  		end
	end

	def edit
	  	@message = Message.find(params[:id])
	end

	def update
	  	@message = Message.find(params[:id])
	 
	  	if @message.update(message_params)
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
