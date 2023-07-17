class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ganbarus = @user.attempts.ganbaru.order('id DESC').limit(3) #eunmでpartを分岐させてるため、"attempts.ganbaru"としている
    @ganbattas = @user.attempts.ganbatta.order('id DESC').limit(3)#ganbarusとganbattasがattemptsのためattemptを引っ張れる
  end
  
  def ganbaru
    @user = User.find(params[:user_id])
    @ganbarus = @user.attempts.ganbaru.order('id DESC') 
  end
  
  def ganbatta
    @user = User.find(params[:user_id])
    @ganbattas = @user.attempts.ganbatta.order('id DESC')
  end
  
    def withdrawal
      @user = current_user
      @user.update!(is_deleted: true)
      reset_session
      redirect_to root_path
  end
  
  private
  
  def user_params
     params.require(:user).permit(:name, :profile, :is_deleted)
  end
  
end
