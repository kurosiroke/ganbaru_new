class Public::AttemptsController < ApplicationController
    def search
        @attempts = Attempt.published.all #投稿されたリストのすべて
        if params[:keyword].present?
          @attempts = Attempt.published.all.left_joins(:tags).where("tags.tag_type LIKE?", "%#{params[:keyword]}%")
        end
    end
    
    def index
        @attempts = Attempt.published.all.order("created_at DESC").page(params[:page])
    end
    
    def ganbaru #がんばるリスト
        @user = current_user
        @users = User.all
        @attempt = Attempt.new #newを表示させるため
        #並び替え
        if params[:latest]
          @attempts = Attempt.published.ganbaru.latest.page(params[:page]).per(7)
        elsif params[:old]
          @attempts = Attempt.published.ganbaru.old.page(params[:page]).per(7)
        else
          @attempts = Attempt.published.ganbaru.all.page(params[:page]).per(7)
        end
    end
       
    def ganbatta #がんばったリスト
        @user = current_user
        @attempt = Attempt.new
           #並び替え
        if params[:latest]
          @attempts = Attempt.published.ganbatta.latest.page(params[:page]).per(7)
        elsif params[:old]
          @attempts = Attempt.published.ganbatta.old.page(params[:page]).per(7)
        else
          @attempts = Attempt.published.ganbatta.all.page(params[:page]).per(7)
        end
    end
    
    def my_ganbaru
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
        if @attempt.is_published_flag == false
         redirect_to attempts_path  
        end
    end 
    
    def edit
        is_matching_login_user#アクセス制限
        @attempt = Attempt.find(params[:id])
    end
    
    def create
        flash[:notice] = nil #リセットするため
        @errormessage = "" #リセットするため
        @user = current_user
        @attempt = current_user.attempts.build(attempt_params) # actionの指定と保存を行う
        @attempt.part = 'ganbaru' #newで作成時はpartをがんばるに指定
        if attempt_params[:tag_ids].nil? && @attempt.invalid? #タグとattemptが空の場合の分類
           @errormessage = "タグをチェックしてください。"
           flash[:notice] = "がんばることを入力してください。"
           attempt = @user.attempts
           @favorite = attempt.connection #お気に入り
           @ganbarus = current_user.attempts.ganbaru.order('id DESC').limit(3)
           @ganbattas = current_user.attempts.ganbatta.order('id DESC').limit(3) 
          render "public/mypages/show"
        elsif attempt_params[:tag_ids].nil?
           @errormessage = "タグをチェックしてください。"
           attempt = @user.attempts
           @favorite = attempt.connection
           @ganbarus = current_user.attempts.ganbaru.order('id DESC').limit(3)
           @ganbattas = current_user.attempts.ganbatta.order('id DESC').limit(3) 
          render "public/mypages/show"
        else
        if @attempt.save
           flash[:notice] = "投稿されました。"
           redirect_to mypage_path(@attempt.user_id)
        else
          flash[:notice] = "がんばることを入力してください。"
          attempt = @user.attempts
          @favorite = attempt.connection
          @ganbarus = current_user.attempts.ganbaru.order('id DESC').limit(3)
          @ganbattas = current_user.attempts.ganbatta.order('id DESC').limit(3) 
          render "public/mypages/show"
        end
        end
    end
    
    def update
        is_matching_login_user#アクセス制限
        @attempt = Attempt.find(params[:id])
        @attempt.update(attempt_params)
        redirect_to mypage_path(@attempt.user_id)
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
    
    def is_matching_login_user #アクセス制限
      attempt = Attempt.find(params[:id])
      unless attempt.user_id == current_user.id
        redirect_to attempt_path
      end
    end
end