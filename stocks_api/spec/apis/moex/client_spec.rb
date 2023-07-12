require 'rails_helper'

describe Moex::Client do
  subject(:client) { described_class.new }
  before { allow(Moex::Client).to receive(:get) { |link| link } }

  describe '#ticker_history' do
    let(:url) { "#{Moex::Client.config['ticker_history']}SBER?from=2013-03-03" }

    it do
      expect(client.ticker_history('SBER', from: '2013-03-03')).to eq(url)
    end
  end

  describe '#tickers_info' do
    let(:url) { Moex::Client.config['tickers_info'] }

    it do
      expect(client.tickers_info).to eq(url)
    end
  end
end
