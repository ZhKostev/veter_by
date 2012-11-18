class ApplicationController < ActionController::Base
  before_filter :set_bg_for_body
  protect_from_forgery

  def after_sign_in_path_for(resource)
    admin_path
  end

  def set_bg_for_body
    @bg_image_id = session[:bg_img_id] || (rand(4) + 1)
  end
end
