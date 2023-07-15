class Public::HomesController < ApplicationController

    def top
        @attempts = Attempt.all
        @ganbaru = Attempt.all.ganbaru.order('id DESC').limit(3)  # がんばるりすと
        @ganbatta = Attempt.all.ganbatta.order('id DESC').limit(3)  # がんばったリスト  # ASCだと古い順でDESCで新着順で表示
    end
    
    def about
    end
    

end
