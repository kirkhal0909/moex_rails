module Moex
  module Resume
    class BaseResume < ApplicationService
      attr_reader :tickers

      def initialize(tickers = nil)
        @tickers = tickers || Ticker.where(list_level: 1)
      end
    end
  end
end
