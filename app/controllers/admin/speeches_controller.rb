class Admin::SpeechesController < ApplicationController
  def index
      @speeches = Speech.all.order("created_at DESC").page(params[:page])
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
