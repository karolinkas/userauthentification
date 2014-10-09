class UsersController < ApplicationController
  

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save # will check password match
        # User has been created
        # Log them in automatically
        session[:user_id] = @user.id
        redirect_to root_url
      else
        # There's been an error
        render :new
      end
    end

  private
  def user_params
    params.require(:user).permit(
          :email, :password, :password_confirmation)
  end


end
