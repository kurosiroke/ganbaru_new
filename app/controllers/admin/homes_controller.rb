class Admin::HomesController < ApplicationController
  def top
      @attempts = Attempt.all
      @ganbaru = Attempt.all.ganbaru.order('id DESC').limit(3)  # がんばるリスト
      @ganbatta = Attempt.all.ganbatta.order('id DESC').limit(3)  # がんばったリスト  # ASCだと古い順でDESCで新着順で表示
  end
end
