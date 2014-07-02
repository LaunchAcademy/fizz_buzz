class ChangeColumnDescriptionFromBreweries < ActiveRecord::Migration
  def up
    change_column :breweries, :description, :text, null: true
  end

  def down
    change_column :breweries, :description, :text, null: false
  end
end
