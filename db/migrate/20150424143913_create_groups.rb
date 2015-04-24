class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :users

      t.timestamps null: false
    end
  end
end
