class Brewery < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :city }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone_number, presence: true
end
