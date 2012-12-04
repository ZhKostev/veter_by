module ApplicationHelper
  def show_chanel(wind_generator)
    "/wind_generator_chanel/#{wind_generator.id}"
  end

  def index_chanel(region)
    "/region_chanel/#{region.id}"
  end
end
