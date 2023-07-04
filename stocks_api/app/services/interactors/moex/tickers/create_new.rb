module Interactors
  module Moex
    module Tickers
      class CreateNew < BaseInteractor
        def call
          Ticker.create(rows_new)
        end

        def rows_new
          parsed_rows.select { |row| ticker_list.exclude?(row[:symbol]) }
        end

        def ticker_list
          @ticker_list ||= context.tickers.pluck('symbol')
        end

        def parsed_rows
          context.parsed_rows
        end
      end
    end
  end
end
