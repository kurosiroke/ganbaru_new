class Public::HomesController < ApplicationController

    def top
        @users = User.all
        @user = current_user
        @actions = Action.all
        
        @ganbaru = Action.all.ganbaru # がんばるりすと
        @ganbatta = Action.all.ganbatta # がんばったリスト
        # @ganbarus = Actions.ganbaru.order('id DESC').limit(3)        # ASCだと古い順でDESCで新着順です。
        # @ganbattas = Actions.ganbatta.order('id DESC').limit(3) #ログインしているユーザーの一覧
    end
    
    def about
    end
    

end
