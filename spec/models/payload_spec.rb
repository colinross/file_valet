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
end
