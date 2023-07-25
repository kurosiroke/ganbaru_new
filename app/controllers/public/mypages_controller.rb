class Public::MypagesController < ApplicationController
    
    #before_action :current_user, only: [:edit, :update]

    def show
        flash[:notice] = nil #リセットするため
        @user = User.find(params[:id])
        @attempt = Attempt.new
        attempt = @user.attempts
        @favorite = attempt.connection #お気に入りの表示に使う
        @ganbarus = current_user.attempts.ganbaru.order('id DESC').limit(3)        # ASCだと古い順でDESCで新着順です。
        @ganbattas = current_user.attempts.ganbatta.order('id DESC').limit(3) #ログインしているユーザーの一覧
    end 
    
    def ganbaru_index
    end
    
    def ganbaru_index
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :profile, :part)
    end

end
