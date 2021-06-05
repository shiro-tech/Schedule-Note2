class CreateProgressComments < ActiveRecord::Migration[5.2]
  def change
    create_table :progress_comments do |t|
      t.integer :user_id
      t.integer :progress_id
      t.string :body
      t.timestamps
    end
  end
end
