class ChangeColumnPhoneNumberFromBreweries < ActiveRecord::Migration
  def up
    change_column :breweries, :phone_number, :string, null: true
  end

  def down
    change_column :breweries, :phone_number, :string, null: false
  end
end
