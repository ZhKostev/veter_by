#encoding: utf-8
class WindGenerator < ActiveRecord::Base
  acts_as_gmappable
  mount_uploader :photo, PhotoUploader

  has_many :notifications, :dependent => :destroy
  has_many :generator_states, :dependent => :destroy, :order => 'created_at ASC'
  accepts_nested_attributes_for :notifications, :allow_destroy => true
  belongs_to :region

  attr_accessible :gmaps, :latitude, :longitude, :max_rated_power, :max_wind_speed,
                  :min_rated_power, :min_rated_wind_speed, :title, :region, :region_id,
                  :notifications_attributes, :photo, :photo_cache

  validates :title, :region_id, :longitude, :latitude, :max_rated_power,
            :min_rated_power, :min_rated_wind_speed, :max_wind_speed, :presence => true

  def current_state
    generator_states.last
  end

  def not_working?
    current_state.try(:error)
  end

  def current_power
    return 0 if not_working?
    (current_state.try(:power) || 0).round(2)
  end

  def current_wind_speed
    return 0 if not_working?
    (current_state.try(:wind_speed) || 0).round(2)
  end

  def gmaps4rails_address
    "minsk"
  end

  def gmaps4rails_infowindow
    "<div class='gmaps_info'>" +
        "<div class='left img_cont'>" +
        "<img src='#{photo_url(:thumb)}' alt='#{title}'/>" +
        "</div>" +
        "<div class='left desc_cont'>" +
        "<h4>#{title}</h4>" +
        "<div><b>Current Power:</b> #{5}</div>" +
        "<div><b>Current Wind Speed:</b> #{5}</div>" +
        "<a href='/#{region.id}/wind_generators/#{id}'>Подробнее</a>" +
        "</div>" +
    "</div>"
  end
end
