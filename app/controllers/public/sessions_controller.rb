# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  protected
    # 退会しているかを判断するメソッド↓
  def user_state
      #  ↓emailが存在。アカウントをとってくる
    @user = User.find_by(email: params[:user][:email])
      # メールアドレスが正しいかを確認↓
    return if !@user
     #パスワード間違ってたらはじく↓
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted)#←退会しているかどうかも確認
    # ↓
    redirect_to new_user_registration_path
    
    end
  end
end
