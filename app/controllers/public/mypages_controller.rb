class Public::MypagesController < ApplicationController
    
    #before_action :current_user, only: [:edit, :update]

    def show
        @user = current_user
        #@action = Action.new
        @ganbaru = Action.all.ganbaru.order('id DESC').limit(3)        # ASCだと古い順でDESCで新着順です。
        @ganbatta = Action.all.ganbatta.order('id DESC').limit(3) 
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
