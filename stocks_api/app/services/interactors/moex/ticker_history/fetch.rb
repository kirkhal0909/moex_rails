module Interactors
  module Moex
    module TickerHistory
      class Fetch < BaseInteractor
        before { context.start_date ||= Date.new(2022) }

        def call
          date = start_date
          return if last_updated_date == Date.today - 1

          while date < Date.today
            data = parsed_rows(date)
            TickerValue.create(data)
            date += 120.days
          end
        end

        def start_date
          last_updated_date || context.start_date
        end

        def last_updated_date
          context.ticker_values.first&.date
        end

        def parsed_rows(date)
          rows(date).map do |row|
            {
              ticker_id: context.ticker_id,
              date: row['TRADEDATE'],
              open: row['OPEN'], low: row['LOW'], high: row['HIGH'], close: row['CLOSE'],
              volume: row['VOLUME'],
              value: row['VALUE'],
              capitalization: 0
            }
          end
        end

        def response(date)
          client.ticker_history(context.symbol, { from: date.iso8601 })
        end
      end
    end
  end
end
