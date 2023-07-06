class Public::MypagesController < ApplicationController
    
    #before_action :current_user, only: [:edit, :update]

    def show
        @user = User.find(params[:id])
        @attempt = @user.attempts
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
