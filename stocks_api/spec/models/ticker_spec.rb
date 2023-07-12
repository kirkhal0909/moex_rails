require 'rails_helper'

describe Ticker, type: :model do
  describe 'associations' do
    it { should have_many(:news) }
    it { should have_many(:ticker_values) }
  end
end
