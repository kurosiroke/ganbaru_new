class Public::AttemptsController < ApplicationController
    
    def index
        @user = current_user
        @ganbaru = Attempt.all.ganbaru # がんばるりすと
        @ganbatta = Attempt.all.ganbatta # がんばったリスト
    end
    
    def ganbaru
        @user = current_user
        @attempt = Attempt.new #newを表示させるため
        @ganbaru = Attempt.all.ganbaru.order("created_at DESC").limit(8) # がんばるりすと 新着順
    end
       
    def ganbatta
        @user = current_user
        @attempt = Attempt.new
        @ganbatta = Attempt.all.ganbatta.order("created_at DESC").limit(8) # がんばったリスト 新着順
    end
    
    def my_ganbaru
        @attempt = Attempt.all.ganbaru.order("created_at DESC").limit(8)
        
    end
    
    def my_ganbatta
        @attempt = Attempt.all.ganbatta.order("created_at DESC").limit(8)
    end
    
    def show
        @attempt = Attempt.find(params[:id])#ユーザーの投稿のshowを表示する
    end 
    
    def edit
        @attempt = Attempt.find(params[:id])
    end
    
    def create
        @user = current_user
        @attempt = current_user.attempts.build(attempt_params) # actionの指定と保存を行う
        @attempt.part = 'ganbaru' #newで作成時はpartをがんばるに指定
        @attempt.save
        redirect_to my_ganbaru_attempts_path #myがんばるリストに移動
    end
    
    def update
        #byebug
        @attempt = Attempt.find(params[:id])
        @attempt.update(gaction_params)
        redirect_to ganbatta_attempts_path
    end
    
    def destroy
        attempt = Attempt.find(params[:id])
        attempt.destroy
        redirect_to  my_ganbaru_attempts_path
    end
   
    private
    
    def gaction_params
        #params.permit(:content, :created_at)
        params.require(:attempt).permit(:content, :part)
    end
 
end