class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false #userのID
      t.integer :attempt_id, null: false #取り組みのID
      t.timestamps
    end
  end
end
