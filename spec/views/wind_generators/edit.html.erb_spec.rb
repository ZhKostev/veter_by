require 'spec_helper'

describe "wind_generators/edit" do
  before(:each) do
    @wind_generator = assign(:wind_generator, stub_model(WindGenerator,
      :title => "MyString",
      :min_rated_power => 1.5,
      :max_rated_power => 1.5,
      :min_rated_wind_speed => 1.5,
      :max_wind_speed => 1.5,
      :latitude => 1.5,
      :longitude => 1.5,
      :gmaps => false
    ))
  end

  it "renders the edit wind_generator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wind_generators_path(@wind_generator), :method => "post" do
      assert_select "input#wind_generator_title", :name => "wind_generator[title]"
      assert_select "input#wind_generator_min_rated_power", :name => "wind_generator[min_rated_power]"
      assert_select "input#wind_generator_max_rated_power", :name => "wind_generator[max_rated_power]"
      assert_select "input#wind_generator_min_rated_wind_speed", :name => "wind_generator[min_rated_wind_speed]"
      assert_select "input#wind_generator_max_wind_speed", :name => "wind_generator[max_wind_speed]"
      assert_select "input#wind_generator_latitude", :name => "wind_generator[latitude]"
      assert_select "input#wind_generator_longitude", :name => "wind_generator[longitude]"
      assert_select "input#wind_generator_gmaps", :name => "wind_generator[gmaps]"
    end
  end
end
