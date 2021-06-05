class CreateTopicComments < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_comments do |t|
      t.string :user_id
      t.string :topic_id
      t.string :body
      t.timestamps
    end
  end
end
