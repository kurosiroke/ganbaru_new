class Public::SearchesController < ApplicationController
    def search
    # userとattemptの切り替え
    @range = params[:range] #検索機能
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @attempts =  Attempt.published.all.looks(params[:search], params[:word])
      
    end
    end
end
