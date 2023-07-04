module Interactors
  module Moex
    module TickerHistory
      module LastDay
        class Fetch < BaseInteractor
          def call
            context.last_day_rows = rows(nil, 1).map do |row|
              {
                ticker_id: find_ticker_id(row['SECID']),
                date: row['SYSTIME'].to_date,
                open: row['OPEN'].to_f, low: row['LOW'].to_f, high: row['HIGH'].to_f, close: row['LAST'].to_f,
                volume: row['VOLTODAY'].to_f,
                value: row['VALTODAY_RUR'].to_f,
                capitalization: 0.0
              }
            end
          end

          def response
            CACHE.fetch('moex_last_day_data', expires_in: 3.minute) { client.tickers_info }
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
