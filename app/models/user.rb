class User < ActiveRecord::Base
  validates :role, inclusion: {in: ['user', 'admin', 'brewer']}
end
