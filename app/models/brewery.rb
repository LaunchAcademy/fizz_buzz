class Brewery < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :city }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone_number, presence: true

  def self.search(q)
    where("name ilike ? OR city ilike ?", "%#{q}%", "%#{q}%")
  end

end
