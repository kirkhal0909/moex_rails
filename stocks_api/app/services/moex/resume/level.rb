module Moex
  module Resume
    class Level < BaseResume
      def call
        resume.sort_by { |_key, value| [value[:days], value[:count]] }.reverse
      end

      def resume
        tickers.each_with_object({}) do |ticker, results|
          symbol = ticker.symbol
          result = Interactors::Moex::FetchHistoryWithTactics.call(symbol: symbol)
          next if result.level.blank?

          results[symbol] = result.level
        end
      end
    end
  end
end
