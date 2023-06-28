# frozen_string_literal: true

class DeviseCreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.timestamps
    end
  end
end
