require "rails_helper"

RSpec.describe PayloadsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/payloads/1").to route_to("payloads#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/payloads").to route_to("payloads#create")
    end
  end
end
