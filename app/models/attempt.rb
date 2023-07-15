class Attempt < ApplicationRecord
  has_many :favorites, dependent: :destroy #お気に入りの設定、削除されたら削除
  has_many :speeches, dependent: :destroy #コメントの設定。削除されたら削除
  belongs_to :user
  has_many :attempt_and_tags, dependent: :destroy
  has_many :tags, through: :attempt_and_tags

  validates :content, presence: true #取り組み内容を入れないと投稿させない
  validates :is_published_flag, presence: true #タグを選択しないと投稿させない。
  
  enum part: { ganbaru: 0, ganbatta: 1 } 
  
  #公開・非公開機能
  scope :published, -> {where(is_published_flag: true)}
  scope :unpublished, -> {where(is_published_flag: false)}
  
  def self.search(keyword)
    where("facility_name LIKE ? or address LIKE ? or detailed_description LIKE ?", "%#{sanitize_sql_like(keyword)}%", "%#{sanitize_sql_like(keyword)}%", "%#{sanitize_sql_like(keyword)}%")
  end
  
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
