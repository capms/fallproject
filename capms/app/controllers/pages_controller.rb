class PagesController < ApplicationController

  def index
    if user_signed_in?
      render :index
    else
      #alternate way to call url prefix
      redirect_to new_user_session_url
      #same as:
      #redirect_to '/users/sign_in'
    end
  end

end