module Interactors
  module Moex
    module Tickers
      class ReadTickers < BaseInteractor
        def call
          context.tickers = Ticker.all
        end
      end
    end
  end
end
