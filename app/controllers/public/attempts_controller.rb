class Public::AttemptsController < ApplicationController
    def search
        @attempts = Attempt.all
        if params[:keyword].present?
            @attempts = Attempt.left_joins(:tags).where("tags.tag_type LIKE?", "%#{params[:keyword]}%")
        end
    end
    
    def index
        @attempts = Attempt.published.all.order("created_at DESC").page(params[:page])
    end
    
    def ganbaru
        @user = current_user
        @users = User.all
        @attempt = Attempt.new #newを表示させるため
        @attempts = Attempt.published.ganbaru.order("created_at DESC").page(params[:page]) # がんばるりすと 新着順
    end
       
    def ganbatta
        @user = current_user
        @attempt = Attempt.new
        @attempts = Attempt.published.ganbatta.order("created_at DESC").page(params[:page])# がんばったリスト 新着
    end
    
    def my_ganbaru
        #@attempt = Attempt.all.ganbaru.order("created_at DESC").limit(8) ←すべてのユーザーを表示する。
        @attempts = current_user.attempts.ganbaru.order('id DESC').page(params[:page]) #ログインしているユーザーのみを表示させる
        @attempt = Attempt.new
    end
    
    def my_ganbatta
        @attempts = current_user.attempts.ganbatta.order('id DESC').page(params[:page])
        @attempt = Attempt.new
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
        if @attempt.save
           flash[:notice] = "投稿されました."
           redirect_to my_ganbaru_attempts_path
        else
          attempt = @user.attempts
          @favorite = attempt.connection
          @ganbarus = current_user.attempts.ganbaru.order('id DESC').limit(3)
          @ganbattas = current_user.attempts.ganbatta.order('id DESC').limit(3) 
          render "public/mypages/show"
        end
           #myがんばるリストに移動
    end
    
    def update
        #byebug
        @attempt = Attempt.find(params[:id])
        @attempt.update(attempt_params)
        
        redirect_to attempts_path
    end
    
    def destroy
        attempt = Attempt.find(params[:id])
        attempt.destroy
        redirect_to  my_ganbaru_attempts_path
    end
   
    private
    
    def attempt_params
        params.require(:attempt).permit(:content, :part, :is_published_flag, tag_ids: [])
    end
 
end