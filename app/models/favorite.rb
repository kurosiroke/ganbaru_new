class Favorite < ApplicationRecord
    belongs_to :users
    belongs_to :attempts
end
