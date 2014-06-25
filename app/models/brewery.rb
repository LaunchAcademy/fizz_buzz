class Brewery < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true
  validates :name, uniqueness: { scope: :city }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone_number, presence: true
end
