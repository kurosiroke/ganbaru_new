class Public::MypagesController < ApplicationController

    def show
        flash[:notice] = nil #リセットするため
        @user = User.find(params[:id])
        @attempt = Attempt.new
        attempt = @user.attempts
        @favorite = attempt.connection #お気に入りの表示に使う
        @ganbarus = current_user.attempts.ganbaru.order('id DESC').limit(3)
        @ganbattas = current_user.attempts.ganbatta.order('id DESC').limit(3) 
        # ASCだと古い順でDESCで新着順
        #ログインしているユーザーの一覧
    end 
    
    def destroy
        attempt = Attempt.find(params[:id])
        attempt.destroy
        redirect_to mypage_path(attempt.user_id)
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :profile, :part)
    end

end
