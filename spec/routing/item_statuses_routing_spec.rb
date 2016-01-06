require "spec_helper"

describe ItemStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/item_statuses").should route_to("item_statuses#index")
    end

    it "routes to #new" do
      get("/item_statuses/new").should route_to("item_statuses#new")
    end

    it "routes to #show" do
      get("/item_statuses/1").should route_to("item_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/item_statuses/1/edit").should route_to("item_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/item_statuses").should route_to("item_statuses#create")
    end

    it "routes to #update" do
      put("/item_statuses/1").should route_to("item_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/item_statuses/1").should route_to("item_statuses#destroy", :id => "1")
    end

  end
end
