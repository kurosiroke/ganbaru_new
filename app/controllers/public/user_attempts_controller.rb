class Public::UserAttemptsController < ApplicationController
  def show
      @user = User.find(params[:id])
      @attempt = @user.attempts
      @ganbarus = current_user.attempts.ganbaru.order('id DESC') 
      @ganbattas = current_user.attempts.ganbatta.order('id DESC')
  end
  
  def ganbaru
  end
  
  def ganbaru
  end
  
  
  private
  
  def user_params
      params.require(:user).permit(:name, :profile, :part)
  end
end