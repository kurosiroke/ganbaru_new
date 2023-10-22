class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # ↓ eunmでpartを分岐させてるため、"attempts.ganbaru"としている
    @ganbarus = @user.attempts.ganbaru.order('id DESC').limit(3) 
    # ↓ ganbarusとganbattasがattemptsのためattemptを引っ張れる
    @ganbattas = @user.attempts.ganbatta.order('id DESC').limit(3)
  end
  
  def ganbaru
    @user = User.find(params[:user_id])
    @ganbarus = @user.attempts.ganbaru.order('id DESC') #がんばる投稿を新着順で表示
  end
  
  def ganbatta
    @user = User.find(params[:user_id])
    @ganbattas = @user.attempts.ganbatta.order('id DESC') #がんばった投稿を新着で表示
  end
  
    def withdrawal
      @user = current_user
      @user.update!(is_deleted: true) #退会機能 論理削除
      reset_session
      redirect_to root_path
    end
  
  private
  
  def user_params
     params.require(:user).permit(:name, :profile, :is_deleted)
  end
  
end
