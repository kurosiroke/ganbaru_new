class Public::ActionsController < ApplicationController
    
    # has_many :favorites
    # has_many :comments
    # belongs_to :users
    
    def index
         @user = current_user
    end
    
    def ganbaru
        @ganbaru_actions = Action.all.ganbaru # がんばるりすと
    end
    
    def ganbatta
        @ganbatta_actions = Action.all.ganbatta
    end
        
    def show
        @user = current_user
    end 
end