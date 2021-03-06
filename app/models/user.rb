class User < ActiveRecord::Base
  has_many :reviews
  has_many :breweries
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role, inclusion: {in: ['user', 'admin']}
  mount_uploader :profile_photo, ProfilePhotoUploader

  def is_admin?
    role == "admin"
  end
end
