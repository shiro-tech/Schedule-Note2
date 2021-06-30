class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :project_id
      t.string :title
      t.string :file
      t.string :article
      t.timestamps
    end
  end
end
