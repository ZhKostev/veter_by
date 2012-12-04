module ApplicationHelper
  def show_chanel(wind_generator)
    "chanel_of_wind_generator_#{wind_generator.id}"
  end

  def index_chanel(region)
    "chanel_of_region_#{region.id}"
  end
end
