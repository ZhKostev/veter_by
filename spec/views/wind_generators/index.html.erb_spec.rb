require 'spec_helper'

describe "wind_generators/index" do
  before(:each) do
    assign(:wind_generators, [
      stub_model(WindGenerator,
        :title => "Title",
        :min_rated_power => 1.5,
        :max_rated_power => 1.5,
        :min_rated_wind_speed => 1.5,
        :max_wind_speed => 1.5,
        :latitude => 1.5,
        :longitude => 1.5,
        :gmaps => false
      ),
      stub_model(WindGenerator,
        :title => "Title",
        :min_rated_power => 1.5,
        :max_rated_power => 1.5,
        :min_rated_wind_speed => 1.5,
        :max_wind_speed => 1.5,
        :latitude => 1.5,
        :longitude => 1.5,
        :gmaps => false
      )
    ])
  end

  it "renders a list of wind_generators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
