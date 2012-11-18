require "spec_helper"

describe WindGeneratorsController do
  describe "routing" do

    it "routes to #index" do
      get("/wind_generators").should route_to("wind_generators#index")
    end

    it "routes to #new" do
      get("/wind_generators/new").should route_to("wind_generators#new")
    end

    it "routes to #show" do
      get("/wind_generators/1").should route_to("wind_generators#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wind_generators/1/edit").should route_to("wind_generators#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wind_generators").should route_to("wind_generators#create")
    end

    it "routes to #update" do
      put("/wind_generators/1").should route_to("wind_generators#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wind_generators/1").should route_to("wind_generators#destroy", :id => "1")
    end

  end
end
