class CreateTopicComments < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_comments do |t|
      t.integer :user_id
      t.integer :topic_id
      t.integer :project_id
      t.string :body
      t.timestamps
    end
  end
end
