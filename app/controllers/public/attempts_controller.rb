class Public::AttemptsController < ApplicationController
    
    def index
        @user = current_user
        @ganbaru = Attempt.page(params[:page]).ganbaru # がんばるりすと
        @ganbatta = Attempt.page(params[:page]).ganbatta # がんばったリスト
        # @attempts = params[:tag_id].present? ? Tag.find(params[:tag_id]).attempts : Attempt.all
    end
    
    def ganbaru
        @user = current_user
        @attempt = Attempt.new #newを表示させるため
        @Attempt = Attempt.all.ganbaru.order("created_at DESC").page(params[:page]) # がんばるりすと 新着順
        @attempts = params[:tag_id].present? ? Tag.find(params[:tag_id]).attempts : Attempt.all
    end
       
    def ganbatta
        @user = current_user
        @attempt = Attempt.new
        @Attempt = Attempt.all.ganbatta.order("created_at DESC").page(params[:page])# がんばったリスト 新着順
        @attempts = params[:tag_id].present? ? Tag.find(params[:tag_id]).attempts : Attempt.all
    end
    
    def my_ganbaru
        #@attempt = Attempt.all.ganbaru.order("created_at DESC").limit(8) ←すべてのユーザーを表示する。
        @attempt = current_user.attempts.ganbaru.order('id DESC').page(params[:page]) #ログインしているユーザーのみを表示させる
        @attempts = params[:tag_id].present? ? Tag.find(params[:tag_id]).attempts : Attempt.all
    end
    
    def my_ganbatta
        @attempt = current_user.attempts.ganbatta.order('id DESC').page(params[:page])
        @attempts = params[:tag_id].present? ? Tag.find(params[:tag_id]).attempts : Attempt.all
    end
    
    def show
        @attempt = Attempt.find(params[:id]) #ユーザーの投稿のshowを表示する
        @speech = Speech.new
    end 
    
    def edit
        @attempt = Attempt.find(params[:id])
    end
    
    def create
        @user = current_user
        @attempt = current_user.attempts.build(attempt_params) # actionの指定と保存を行う
        @attempt.part = 'ganbaru' #newで作成時はpartをがんばるに指定
        @attempt.save
        byebug
        redirect_to my_ganbaru_attempts_path #myがんばるリストに移動
    end
    
    def update
        #byebug
        @attempt = Attempt.find(params[:id])
        @attempt.update(attempt_params)
        redirect_to ganbatta_attempts_path
    end
    
    def destroy
        attempt = Attempt.find(params[:id])
        attempt.destroy
        redirect_to  my_ganbaru_attempts_path
    end
   
    private
    
    def attempt_params
        #params.permit(:content, :created_at)
        params.require(:attempt).permit(:content, :part, tag_ids: [])
    end
 
end