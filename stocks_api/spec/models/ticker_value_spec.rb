require 'rails_helper'

describe TickerValue, type: :model do
  describe 'associations' do
    it { should belong_to(:ticker).class_name('Ticker') }
  end

  describe 'validations' do
    it { should validate_exclusion_of(:open).in_array([0, nil]) }
    it { should validate_exclusion_of(:low).in_array([0, nil]) }
    it { should validate_exclusion_of(:high).in_array([0, nil]) }
    it { should validate_exclusion_of(:close).in_array([0, nil]) }
    it { should validate_uniqueness_of(:ticker_id).scoped_to(:date) }
  end
end
