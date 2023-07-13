class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ganbarus = @user.attempts.ganbaru.order('id DESC').limit(3) #eunmでpartを分岐させてるため、"attempts.ganbaru"としている
    @ganbattas = @user.attempts.ganbatta.order('id DESC').limit(3)#ganbarusとganbattasがattemptsのためattemptを引っ張れる
  end
  
  def ganbaru
    @user = User.find(params[:id])
    @ganbarus = current_user.attempts.ganbaru.order('id DESC') 
  end
  
  def ganbaru
    @user = User.find(params[:id])
    @ganbattas = current_user.attempts.ganbatta.order('id DESC')
  end
  
  private
  
  def user_params
     params.require(:user).permit(:name, :profile)
  end
  
end
