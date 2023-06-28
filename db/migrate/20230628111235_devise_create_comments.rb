# frozen_string_literal: true

class DeviseCreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment, null: false # コメント本文
      t.timestamps
    end
  end
end
