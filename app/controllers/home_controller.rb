class HomeController < ApplicationController
  def index
    @gmap_json = WindGenerator.all.to_gmaps4rails
  end
end
