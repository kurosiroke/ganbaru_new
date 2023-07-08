class Public::SpeechesController < ApplicationController
  def create
    post_attempt = Attempts.find(params[:post_attempt_id]) #コメントの設定 
    speeche = current_user.post_speeches.new(post_speeche_params) #userのnewとcorrent_user
    speeche.post_attempt_id = post_attempts.id
    speeche.save
    redirect_to  post_attempt_path(post_attempt)
  end

  private

  def post_speeche_params
    params.require(:post_speeche).permit(:speeche)
  end
