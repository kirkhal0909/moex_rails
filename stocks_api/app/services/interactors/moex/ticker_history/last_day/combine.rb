module Interactors
  module Moex
    module TickerHistory
      module LastDay
        class Combine < BaseInteractor
          def call
            context.actual_history = [last_day_attributes].compact + rows_attributes
          end

          def not_actual_data?
            Time.zone.now.hour < 10
          end

          def last_day_attributes
            return if not_actual_data?

            context.last_day_rows.find { |row| row[:ticker_id] == context.ticker_id }.deep_stringify_keys
          end

          def rows_attributes
            context.ticker_values.map(&:attributes)
          end
        end
      end
    end
  end
end
