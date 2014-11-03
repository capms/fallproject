class MessageBoardController < ApplicationController
  def index
  end

  	def new
	end

	def create
  @message = message_boards.new(params[:message_board])
 
  @message.save
  redirect_to @message
	end

	private
  def article_params
    params.require(:message_board).permit(:title, :text)
  end
end
