class Admin::AttemptsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
      @attempts = Attempt.all.order("created_at DESC").page(params[:page])
  end
  
  def destroy
      attempt = Attempt.find(params[:id])
      attempt.destroy
      redirect_to '/admin/attempts'
  end

  private
  
  def attempt_params
    params.require(:attempt).permit(:content)
  end

end
