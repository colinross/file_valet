require 'rails_helper'

RSpec.describe PayloadsController, type: :controller do
  let!(:existing_record) { FactoryBot.create(:payload, label: 'existing_label_one') }
  let(:valid_attributes) { FactoryBot.attributes_for(:payload) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:payload).merge(label: 'existing_label_one') }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PayloadsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      payload = Payload.create! valid_attributes
      get :show, params: { uuid: payload.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Payload" do
        expect {
          post :create, params: { payload: valid_attributes }, session: valid_session
        }.to change(Payload, :count).by(1)
      end

      it "renders a JSON response with the new payload" do
        post :create, params: { payload: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(payload_url(Payload.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new payload" do
        post :create, params: { payload: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
