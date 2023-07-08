class Speech < ApplicationRecord
    belongs_to :user
    belongs_to :attempt
end
