module Interactors
  module Moex
    module TickerHistory
      module LastDay
        class Fetch < BaseInteractor
          def call
            context.rows = rows(nil, 1).map do |row|
              {
                ticker_id: find_ticker_id(row['SECID']),
                date: row['SYSTIME'].to_date,
                open: row['OPEN'], low: row['LOW'], high: row['HIGH'], close: row['CLOSE'],
                volume: row['VOLTODAY'],
                value: row['VALTODAY_RUR'],
                capitalization: 0
              }
            end
          end

          def response
            client.tickers_info
          end

          def find_ticker_id(symbol)
            tickers.select { |ticker| ticker.symbol == symbol }.first&.id
          end

          def tickers
            @tickers ||= Ticker.all
          end
        end
      end
    end
  end
end
