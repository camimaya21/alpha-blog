class SessionsController < ApplicationController
  def new
    redirect_to articles_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = user.id
      flash[:notify] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notify] = "Logged out"
    redirect_to root_path
  end
end