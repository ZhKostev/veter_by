class Region < ActiveRecord::Base
  has_many :wind_generators, :dependent => :destroy
  attr_accessible :title
  validates :title, :presence => true, :uniqueness => true
end
