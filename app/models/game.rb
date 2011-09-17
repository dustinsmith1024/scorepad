class Game < ActiveRecord::Base
  attr_accessible :type_of
  belongs_to :user
  has_many :players, :dependent => :destroy
end
