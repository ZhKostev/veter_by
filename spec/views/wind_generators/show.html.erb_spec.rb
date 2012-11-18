require 'spec_helper'

describe "wind_generators/show" do
  before(:each) do
    @wind_generator = assign(:wind_generator, stub_model(WindGenerator,
      :title => "Title",
      :min_rated_power => 1.5,
      :max_rated_power => 1.5,
      :min_rated_wind_speed => 1.5,
      :max_wind_speed => 1.5,
      :latitude => 1.5,
      :longitude => 1.5,
      :gmaps => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/false/)
  end
end
