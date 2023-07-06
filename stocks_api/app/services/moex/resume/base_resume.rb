module Moex
  module Resume
    class BaseResume < ApplicationService
      attr_reader :tickers

      def initialize(tickers = nil)
        @tickers = tickers || Ticker.all
      end
    end
  end
end
