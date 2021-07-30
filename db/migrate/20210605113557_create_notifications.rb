class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :project_id
      t.integer :topic_id
      t.integer :topic_comment_id
      t.integer :progress_id
      t.string :progress_comment_id
      t.integer :event_id
      t.string :news
      t.timestamps
    end
  end
end
