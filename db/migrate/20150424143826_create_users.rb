class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.references :groups

      t.timestamps null: false
    end
  end
end
