class User < ActiveRecord::Base
  has_many :reviews
<<<<<<< HEAD
=======
  has_many :breweries
>>>>>>> f8ce57ea96557b3a83ce45fd9ee2993b2b1cd255
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role, inclusion: {in: ['user', 'admin', 'brewer']}
  mount_uploader :profile_photo, ProfilePhotoUploader
end
