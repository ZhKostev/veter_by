class HomeController < ApplicationController
  def index
    @region = Region.find(params(:region_id)) rescue Region.first
    @gmap_json = @region.wind_generators.all.to_gmaps4rails if @region
  end
end
