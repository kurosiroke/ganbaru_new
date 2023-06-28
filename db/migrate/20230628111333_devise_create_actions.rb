# frozen_string_literal: true

class DeviseCreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.string :content, null: false #取り組み内容
      t.integer :part, null: false #取り組みの状態
      t.timestamps
    end
  end
end
