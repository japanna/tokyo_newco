class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
      log_in user
      if params[:session][:remember_me] == '1'
  			remember(user)
			else
  			forget(user)
			end
      redirect_back_or user
    else
      # Create an error message.
      flash.now[:danger] = 'Please check your email and password combination'
      render 'new'
    end
  end

  def destroy
  	forget(current_user)
  	session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
