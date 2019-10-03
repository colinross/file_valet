require "rails_helper"

RSpec.describe PayloadsController, type: :routing do
  describe "routing" do
    it "routes to #show using uuid" do
      expect(:get => "/payloads/uuid-value").to route_to("payloads#show", :uuid => "uuid-value")
    end

    it "routes to #create" do
      expect(:post => "/payloads").to route_to("payloads#create")
    end
  end
end
