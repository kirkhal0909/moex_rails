module Moex
  module Resume
    module Level
      class Calculate < BaseResume
        def call
          resume.sort_by { |_key, value| [value[:count], value[:days]] }.reverse.to_h
        end

        private

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
end
