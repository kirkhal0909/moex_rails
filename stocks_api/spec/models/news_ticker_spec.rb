require 'rails_helper'

describe NewsTicker, type: :model do
  describe 'associations' do
    it { should belong_to(:ticker) }
    it { should belong_to(:news) }
  end
end
