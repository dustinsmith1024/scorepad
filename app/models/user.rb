class User < ActiveRecord::Base
  attr_accessible :email, :facebook_id
  has_many :games, :dependent => :destroy
  validates_uniqueness_of :email

  # INCLUDE THE UDID -> USER DEVICE ID TO HELP SECURITY
  # USER ID FOR CREATING ACCOUNTS???
  # INCLUDE A PRIVATE KEY THAT IS INCLUDED IN THE APP
  # HELPS SANITY CHECK ITS REAL
end
