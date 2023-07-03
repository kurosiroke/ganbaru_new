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
    
    def my_ganbaru
         @actions = Action.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    end
    
    def my_ganbatta
         @actions = Action.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    end
    
    def show
        @user = User.find params[:id]
    end 
    
    def edit
        @user = User.find params[:id]
    end
    
    def create
        @user = current_user
        @action = current_user.actions.build(action_params) # actionの指定と保存
        @action.part = 'ganbaru' #newで作成時はpartをがんばるに指定
        @action.save
        redirect_to ganbaru_actions_path #がんばるリストに移動
    end
    
    def update
    end
    
    def destroy
    end
   
    private
    
    def action_params
        params.permit(:content)
    end
 
end