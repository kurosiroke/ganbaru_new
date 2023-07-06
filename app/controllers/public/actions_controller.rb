class Public::ActionsController < ApplicationController
    
    def index
        @user = current_user
        @ganbaru = Action.all.ganbaru # がんばるりすと
        @ganbatta = Action.all.ganbatta # がんばったリスト
    end
    
    def ganbaru
        @user = current_user
        @action = Action.new #newを表示させるため
        @ganbaru = Action.all.ganbaru.order("created_at DESC").limit(8) # がんばるりすと 新着順
    end
       
    def ganbatta
        @user = current_user
        @action = Action.new
        @ganbatta = Action.all.ganbatta.order("created_at DESC").limit(8) # がんばったリスト 新着順
    end
    
    def my_ganbaru
        @action = Action.all.ganbaru.order("created_at DESC").limit(8)
        
    end
    
    def my_ganbatta
        @action = Action.all.ganbatta.order("created_at DESC").limit(8)
    end
    
    def show
        @action = Action.find(params[:id])#ユーザーの投稿のshowを表示する
    end 
    
    def edit
        @action = Action.find(params[:id])
    end
    
    def create
        @user = current_user
        @action = current_user.actions.build(action_params) # actionの指定と保存を行う
        @action.part = 'ganbaru' #newで作成時はpartをがんばるに指定
        @action.save
        redirect_to my_ganbaru_actions_path #myがんばるリストに移動
    end
    
    def update
        @action = action.find(params[:id])
        @action.update(action_params)
        redirect_to action_path
    end
    
    def destroy
        action = Action.find(params[:id])
        action.destroy
        redirect_to  my_ganbaru_actions_path
    end
   
    private
    
    def action_params
        params.permit(:content, :created_at)
    end
 
end