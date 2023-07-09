class Tag < ApplicationRecord
  has_many :attempt_and_tags, dependent: :destroy
  has_many :attempts, through: :attempt_and_tags

  validates :tag_type, presence: true
end
