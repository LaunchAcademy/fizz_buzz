class ChangeColumnZipFromBreweries < ActiveRecord::Migration
  def up
    change_column :breweries, :zip, :string, null: true
  end

  def down
    change_column :breweries, :zip, :string, null: false
  end
end
