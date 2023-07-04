module Interactors
  module Moex
    module TickerHistory
      class Read < BaseInteractor
        def call
          context.ticker_id = Ticker.find_by(symbol: symbol)&.id
          write_errors if context.ticker_id.blank?

          context.ticker_values = TickerValue.where(ticker_id: context.ticker_id)
        end

        def write_errors
          context.errors = { erorrs: "Ticker by symbol '#{symbol}' not found" }
          context.fail!
        end

        def symbol
          context.symbol
        end
      end
    end
  end
end
