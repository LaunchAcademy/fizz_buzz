class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :address, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.string :hours
      t.integer :user_id
      t.string  :phone_number, null: false
      t.string :url
      t.timestamps
    end

    add_index :breweries, [:name, :city], unique: true
  end
end
