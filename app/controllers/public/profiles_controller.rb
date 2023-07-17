class Public::ProfilesController < ApplicationController
    
  def edit
      @user = current_user
  end
  
  def update
      # @user = current_user
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to mypage_path(@user)
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