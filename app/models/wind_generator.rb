class WindGenerator < ActiveRecord::Base
  acts_as_gmappable

  has_many :notifications, :dependent => :destroy
  accepts_nested_attributes_for :notifications, :allow_destroy => true
  belongs_to :region

  attr_accessible :gmaps, :latitude, :longitude, :max_rated_power, :max_wind_speed,
                  :min_rated_power, :min_rated_wind_speed, :title, :region, :region_id, :notifications_attributes

  validates :title, :region_id, :longitude, :latitude, :max_rated_power,
            :min_rated_power, :min_rated_wind_speed, :max_wind_speed, :presence => true

  def gmaps4rails_address
    "minsk"
  end
end
