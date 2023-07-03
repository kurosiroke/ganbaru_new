class Public::ProfilesController < ApplicationController
    
    def edit
        @user = current_user
    end
    
    def update
        @user = current_user
        #@user = User.find(current_user.id)
        @user.update(user_params)
        redirect_to mypage_path(@user)
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:profile)
    end
end