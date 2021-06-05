class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders do |t|
      t.string :datetime
      t.string :work_name
      t.string :worker
      t.timestamps
    end
  end
end
