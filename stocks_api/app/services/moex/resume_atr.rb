module Moex
  class ResumeAtr < ApplicationService
    attr_reader :tickers

    def initialize(tickers = nil)
      @tickers = tickers || Ticker.where(list_level: 1)
    end

    def call
      resume.sort_by { |_key, value| value[:today_percent] }
    end

    def resume
      tickers.each_with_object({}) do |ticker, results|
        symbol = ticker.symbol
        result = Interactors::Moex::FetchHistoryWithTactics.call(symbol: symbol)
        next unless result.atr_buy

        results[symbol] = {
          buy: result.atr_buy,
          today_percent: result.today_percent,
          bounce: [result.bounce_from_low, result.bounce_from_high].min,
        }
      end
    end
  end
end
