class Public::HomesController < ApplicationController

  def top
      @attempts = Attempt.all #投稿全て
      # がんばるりすと
      @ganbaru = Attempt.all.ganbaru.where(is_published_flag: true).order('id DESC').limit(3)
      # がんばったリスト  # ASCだと古い順でDESCで新着順で表示
      @ganbatta = Attempt.all.ganbatta.where(is_published_flag: true).order('id DESC').limit(3)
      
  end
  
  def about
  end
    

end
