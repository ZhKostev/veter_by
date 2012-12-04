class HomeController < ApplicationController
  def index
    @region = Region.find(params[:region_id]) rescue Region.first
    calculate_statistic_for_region(@region)
    @gmap_json = @region.wind_generators.all.to_gmaps4rails if @region
  end

end
