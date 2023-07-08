class Public::FavoriteActionsController < ApplicationController
 
  def index
  
  end

  def create
    attempt = Attempt.find(params[:attempt_id])
    favorite = current_user.favorites.new(attempt_id: attempt.id)
    favorite.save
    redirect_to attempt_path(attempt)
  end

  def destroy
    attempt = Attempt.find(params[:attempt_id])
    favorite = current_user.favorites.find_by(attempt_id: attempt.id)
    favorite.destroy
    redirect_to attempt_path(attempt)
  end

end
