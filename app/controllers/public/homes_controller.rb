class Public::HomesController < ApplicationController

    def top
        @users = User.all
        @user = current_user
        @actions = Action.all
        
        @ganbaru = Action.all.ganbaru.order('id DESC').limit(3)  # がんばるりすと
        @ganbatta = Action.all.ganbatta.order('id DESC').limit(3)  # がんばったリスト  # ASCだと古い順でDESCで新着順で表示
    end
    
    def about
    end
    

end
