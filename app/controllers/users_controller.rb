class UsersController < ApplicationController
  
  def show
    @user = find_user
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notify] = "Welcome #{@user.username} to Alpha Blog"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    if @user.update(user_params)
      flash[:notify] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    User.find(params[:id])
  end
  
end