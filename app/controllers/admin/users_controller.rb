class Admin::UsersController < ApplicationController
  def index
    @users = User.all.order("created_at DESC").page(params[:page])
  end
  
  def show
    @user = Usre.find(params[:id])
  end
  
  def edit
    @user = Usre.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "編集しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def destroy
      user = Usre.find(params[:id])
      user.destroy
      redirect_to '/admin/users'
  end
  
  private
  
  def user_params
     params.require(:user).permit(:id, :name, :profile)
  end
end
