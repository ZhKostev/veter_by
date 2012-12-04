class RequestHandleController < ApplicationController
  include ::ApplicationHelper

  def handle_data_request
    @region = Region.find(params[:region_id])
    @wind_generator = WindGenerator.find(params[:id])
    @wind_generator.generator_states.create(:power => params[:power].to_f,
                                           :wind_speed => params[:wind].to_f,
                                           :error => params[:error].present?
    )
    calculate_statistic_for_region(@region)
    PrivatePub.publish_to  show_chanel(@wind_generator) , :chat_message => "Hello, world!"
  end
end
