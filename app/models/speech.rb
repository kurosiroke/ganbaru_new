class Speech < ApplicationRecord
    belongs_to :user
    belongs_to :attempt
    
    validates :speech, presence: true #nilでは投稿させない
end

