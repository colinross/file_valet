require 'rails_helper'

RSpec.describe Payload, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:uuid) }
    it { is_expected.to have_db_column(:label) }
    it { is_expected.to have_db_column(:description) }
  end

  describe 'label' do
    it { is_expected.to validate_uniqueness_of(:label).allow_nil }
  end

  describe 'qr_code' do
    let(:record) { FactoryBot.create(:payload) }
    it { expect(record.qr_code).to be_a ChunkyPNG::Image }
    it 'can be transformed to a data_url' do
      data_url = record.qr_code.to_data_url
      expect(data_url).to be_a String
      expect(data_url).to include('data:image/png;base64')
    end

    context 'error in creation' do
      before do
        dbl = double("QRCode")
        expect(dbl).to receive(:as_png).and_raise StandardError.new("The flotsam and jitsum mixed!")
        expect(RQRCode::QRCode).to receive(:new).and_return(dbl)
      end
      it { expect(record.qr_code).to be_nil }
    end
  end
end
