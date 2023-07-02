class Public::ActionsController < ApplicationController
    
    # has_many :favorites
    # has_many :comments
    # belongs_to :users
    
    def index
        @user = current_user
        @ganbaru = Action.all.ganbaru # がんばるりすと
        @ganbatta = Action.all.ganbatta # がんばったリスト
    end
    
    def ganbaru
        @user = current_user
        @action = Action.new #newを表示させるため
        @ganbaru = Action.all.ganbaru # がんばるりすと
        #byebug
    end
       
    def ganbatta
        @user = current_user
        @action = Action.new
        @ganbatta = Action.all.ganbatta # がんばったリスト
    end
    
    def show
        @user = current_user
    end 
    
    def new
        @user = current_user
    end
    
    def edit
        @user = current_user
    end
    
    def create
        @user = current_user
        @action = current_user.actions.build(action_params) # actionの指定と保存
        @action.part = 'ganbaru' #newで作成時はpartをがんばるに指定
        @action.save
        redirect_to ganbaru_actions_path #がんばるリストに移動する
    end
    
   
    private
    
    def action_params
        params.permit(:content)
    end
 
end