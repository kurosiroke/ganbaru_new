class CreateAttemptAndTags < ActiveRecord::Migration[6.1]
  def change
    create_table :attempt_and_tags do |t|
      t.references :attempt, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
