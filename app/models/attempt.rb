class Attempt < ApplicationRecord
    has_many :favorites
    has_many :speeches, dependent: :destroy#コメントの設定。削除されたら削除
    belongs_to :user
  
  enum part: { ganbaru: 0, ganbatta: 1 } 
  

end
