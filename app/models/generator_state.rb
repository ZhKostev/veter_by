class GeneratorState < ActiveRecord::Base
  belongs_to :wind_generator

  attr_accessible :error, :power, :wind_generator_id, :wind_speed

  validates :power, :wind_generator_id, :wind_speed, :presence => true
end
