class Admin::AttemptsController < ApplicationController
  def index
      @attempts = Attempt.all
  end
  
  def destrory
  end
  
  private
  
  def attempt_params
    params.require(:attempt).permit(:content)
  end
    
end
