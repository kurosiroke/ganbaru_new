class CreateSpeeches < ActiveRecord::Migration[6.1]
  def change
    create_table :speeches do |t|
      t.string :speech, null: false # コメント本文
      t.timestamps
    end
  end
end
