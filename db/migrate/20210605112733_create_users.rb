class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.string :company
      t.string :cellphone
      t.string :admin
      t.timestamps
    end
  end
end
