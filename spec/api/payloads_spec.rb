require 'rails_helper'

RSpec.describe "Payloads", type: :request do
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  describe "GET /payloads" do
    let!(:records) { FactoryBot.create_list(:payload, 3) }
    it 'returns the collection' do
      get payloads_path, headers: headers
      expect(response.body).to be_present
      expect(response_json).to be_a Array
      expect(response_json.size).to eq 3
    end
  end

  describe "GET /payload/{UUID}" do
    let!(:record) { FactoryBot.create(:payload, label: 'drivers license', description: 'ca state issued') }
    it "returns json representation" do
      get payload_path(uuid: record.uuid), headers: headers
      expect(response.body).to be_present
      expect(response_json['label']).to eq record.label
      expect(response_json['description']).to eq record.description
      expect(response_json['uuid']).to eq record.uuid
      expect(response_json['qr_code']).to be_present
      expect(response_json['qr_code']).to include('data:image/png;base64')
    end
  end
  describe "POST /payloads" do
    let(:attributes) { { payload: { label: 'my new doc', description: 'it really is new.' } } }
    it "creates the record" do
      expect {
        post payloads_path, params: attributes.to_json, headers: headers
      }.to change(Payload, :count).by(1)
    end
    it "returns json representation" do
      post payloads_path, params: attributes.to_json, headers: headers

      expect(response.body).to be_present
      expect(response_json['label']).to eq 'my new doc'
      expect(response_json['description']).to eq 'it really is new.'
      expect(response_json['uuid']).to be_present
    end
  end
end
