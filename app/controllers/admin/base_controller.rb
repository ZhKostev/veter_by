class Admin::BaseController <  ActionController::Base
  layout 'admin'
  before_filter :authenticate_account!
  protect_from_forgery
end