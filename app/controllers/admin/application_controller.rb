class Admin::ApplicationController < ActionController::Base
  layout 'admin'
  before_filter :authenticate_account!
  protect_from_forgery
end