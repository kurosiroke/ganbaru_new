class Speech < ApplicationRecord
    belongs_to :users
    belongs_to :attempts
end
