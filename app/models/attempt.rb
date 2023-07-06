class Attempt < ApplicationRecord
    has_many :favorites
    has_many :speeches
    belongs_to :user
  
  enum part: { ganbaru: 0, ganbatta: 1 } 
  

end
