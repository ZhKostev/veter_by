class ApplicationController < ActionController::Base
  before_filter :set_bg_for_body
  before_filter :set_menu_items
  protect_from_forgery

  def after_sign_in_path_for(resource)
    admin_path
  end

  def set_bg_for_body
    @bg_image_id = session[:bg_img_id] || (rand(4) + 1)
  end

  def set_menu_items
    @menu_regions = Region.all
  end

  def calculate_statistic_for_region(region)
    @working_generators_count = region.wind_generators.select{|w_g| w_g.current_state.nil? || !w_g.not_working?}.count
    @error_generators_count = region.wind_generators.select{|w_g| w_g.not_working? }.count
    @current_power = region.wind_generators.inject(0){|sum, w_g| sum += w_g.current_power}.round(2)
    max_power = region.wind_generators.inject(0){|sum, w_g| sum += w_g.max_rated_power}
    @kpd = (@current_power*100/max_power).round(2)
  end
end
