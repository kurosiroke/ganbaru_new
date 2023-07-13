class Public::UsersController < ApplicationController
  def show
    @attempt = Attempt.new
    #@attempts = @user.attempts
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
    @attempt = Attempt.new
  end
  
  private
  
  def user_params
     params.require(:user).permit(:name, :profile)
  end
  
end
