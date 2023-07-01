class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.integer :user_id, null: false 
      t.string :content, null: false #取り組み内容
      t.integer :part #取り組みの状態

      t.timestamps
    end
  end
end
