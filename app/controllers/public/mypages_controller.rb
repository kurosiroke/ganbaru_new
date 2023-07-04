class Public::MypagesController < ApplicationController
    
    #before_action :current_user, only: [:edit, :update]

    def show
        @user = User.find(params[:id])
        @action = @user.actions
        @ganbarus = current_user.actions.ganbaru.order('id DESC').limit(3)        # ASCだと古い順でDESCで新着順です。
        @ganbattas = current_user.actions.ganbatta.order('id DESC').limit(3) #ログインしているユーザーの一覧
    end 
    
    def ganbaru_index
    end
    
    def ganbaru_index
    end
    
    # def edit
    #     @ganbaru = Action.all.ganbaru
    #     @ganbatta = Action.all.ganbatta 
    # end
    
    # def update
    #     @action = action.find(params[:id])
    #     @action.update(action_params)
    #     redirect_to action_path
    # end


    private
    
    def user_params
        params.require(:user).permit(:name, :profile, :part)
    end

end
