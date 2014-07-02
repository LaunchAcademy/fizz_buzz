require "csv"

CSV.foreach("lib/assets/breweries_seeder.csv", headers: true) do |csv|
  brewery = Brewery.find_or_initialize_by(name: csv["name"])
  brewery.city = csv["city"]
  brewery.address = csv["address1"]
  brewery.state = csv["state"]
  brewery.url = csv["website"]
  brewery.description = csv["descript"]
  brewery.phone_number = csv["phone"]

  if brewery.address && brewery.state
    brewery.save
  end
end
