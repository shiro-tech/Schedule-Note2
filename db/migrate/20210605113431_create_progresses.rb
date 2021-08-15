class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :title
      t.string :image
      t.string :article
      t.string :other
      t.timestamps
    end
  end
end
