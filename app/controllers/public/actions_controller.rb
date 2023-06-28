class Public::ActionsController < ApplicationController
    
    has_many :favorites
    has_many :comments
    belongs_to :users
end
