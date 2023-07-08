class Public::SpeechesController < ApplicationController
  def create
    attempt = Attempt.find(params[:speech][:attempt_id]) #コメントの設定
    speech = current_user.speeches.new(speech_params) #userのnewとcorrent_user
    speech.attempt_id = attempt.id
    speech.save
    redirect_to  attempt_path(attempt)
  end

  
  private

  def speech_params
    params.require(:speech).permit(:speech)
  end
end