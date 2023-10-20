class Admin::SpeechesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
      @speeches = Speech.all.order("created_at DESC").page(params[:page]) #すべてのコメント
      @users = User.all
  end
  
  def destroy
      speech = Speech.find(params[:id]) 
      speech.destroy
      redirect_to '/admin/speeches'
  end
  
  
  private

  def speech_params
    params.require(:speech).permit(:speech)
  end
end
