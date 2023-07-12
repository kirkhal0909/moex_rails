require 'rails_helper'

describe News, type: :model do
  describe 'associations' do
    it { should have_many(:tickers) }
  end
end
