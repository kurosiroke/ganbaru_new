class CreateSpeeches < ActiveRecord::Migration[6.1]
  def change
    create_table :speeches do |t|
      t.integer :user_id, null: false
      t.integer :attempt_id, null: false #取り組みのID
      t.string :speech, null: false # コメント本文
      t.timestamps
    end
  end
end
