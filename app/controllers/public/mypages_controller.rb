class Public::MypagesController < ApplicationController
    
    #before_action :current_user, only: [:edit, :update]

    def show
        @user = User.find params[:id]
        @action = Action.find params[:id]
        @ganbaru = current_user.actions.ganbaru.order('id DESC').limit(3)        # ASCだと古い順でDESCで新着順です。
        @ganbatta = current_user.actions.ganbatta.order('id DESC').limit(3) #ログインしているユーザーの一覧
    end 
    
    def ganbaru_index
    end
    
    def ganbaru_index
    end
    
    # def edit
    #     @user = current_user
    #     @ganbaru = Action.all.ganbaru
    #     @ganbatta = Action.all.ganbatta 
    # end
    
    # def update
    #     @user = current_user
    #     #@user = User.find(current_user.id)
    #     @user.update(user_params)
    #     redirect_to user_path
    # end


    private
    
    def user_params
        params.require(:user).permit(:name, :profile, :part)
    end

end
