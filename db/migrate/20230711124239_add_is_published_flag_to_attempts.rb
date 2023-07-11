class AddIsPublishedFlagToAttempts < ActiveRecord::Migration[6.1]
  def change
    add_column :attempts, :is_published_flag, :boolean
  end
end
