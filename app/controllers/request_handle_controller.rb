class RequestHandleController < ApplicationController
  include ::ApplicationHelper

  def handle_data_request
    @region = Region.find(params[:region_id])
    @wind_generator = WindGenerator.find(params[:id])
    PrivatePub.publish_to  show_chanel(@wind_generator) , :chat_message => "Hello, world!"
  end
end
