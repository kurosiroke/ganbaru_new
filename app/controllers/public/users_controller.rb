class Public::UsersController < ApplicationController
    
    before_action :current_user, only: [:edit, :update]
    
    def index
        @users = User.all
    end
    
    def show
        @user = current_user
    end 
    
    def edit
        @user = current_user
       #@user = user.find(params[:id])
    end
    
    
    def update
        #@user = current_user
        @user = User.find(current_user.id)
        @user.update(user_params)
        redirect_to user_path
    end


    private
    
    def user_params
        params.require(:user).permit(:name, :profile)
    end

end
