class NotificationSubscriber < ActiveRecord::Base
  belongs_to :wind_generator
  attr_accessible :email, :power_level

  validates :email, :power_level, :wind_generator_id, :presence => true
end
