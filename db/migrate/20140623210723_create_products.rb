class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :type_id
      t.integer :brewery_id, null: false

      t.timestamps
    end
  end
end
