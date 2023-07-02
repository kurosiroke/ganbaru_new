class Action < ApplicationRecord
    has_many :favorites
    has_many :comments
    belongs_to :user
  
  enum part: { ganbaru: 0, ganbatta: 1 } 
  

end
