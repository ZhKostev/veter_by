class WindGenerator < ActiveRecord::Base
  acts_as_gmappable

  has_many :notification_subscribers, :dependent => :destroy

  attr_accessible :gmaps, :latitude, :longitude, :max_rated_power, :max_wind_speed, :min_rated_power, :min_rated_wind_speed, :title

  def gmaps4rails_address
    "minsk"
  end
end
