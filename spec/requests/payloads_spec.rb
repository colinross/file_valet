require 'rails_helper'

RSpec.describe "Payloads", type: :request do
  describe "GET /payload/{UUID}" do
    let!(:record) { FactoryBot.create(:payload) }
    it "works! (now write some real specs)" do
      get payload_path(record)
      expect(response.body).to be_present
    end
  end
end
