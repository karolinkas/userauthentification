class SessionsController < ApplicationController
  
  def new

  end

  def destroy

  	session[:user_id] = nil
  end
  def create
	
  	user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
       render text: "PASSWORD OK"
      else
        render text: "PASSWORD NOT OK"
      end
    if user &&user.authenticate(params[:password])
      # Password is correct
      # Set the session to current user
      # Will use cookie
      session[:user_id] = user.id
      redirect_to root_url
     else
      render text: "USER NOT FOUND"
      # There's no user or the password is incorrect
      render :new
  	end
  end	
	end
end

