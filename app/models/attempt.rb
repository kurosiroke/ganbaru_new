class Attempt < ApplicationRecord
  has_many :favorites, dependent: :destroy #お気に入りの設定、削除されたら削除
  has_many :speeches, dependent: :destroy #コメントの設定。削除されたら削除
  belongs_to :user

  enum part: { ganbaru: 0, ganbatta: 1 } 
  
  def self.looks(search, word)
    if search == "perfect_match"
      @user = Attempt.where("content LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = Attempt.where("content LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = Attempt.where("content LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = Attempt.where("content LIKE?","%#{word}%")
    else
      @user = Attempt.all
    end
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  
end
