module Interactors
  module Moex
    module Tickers
      class UpdateExists < BaseInteractor
        def call
          tickers.each do |ticker|
            founded_row = parsed_rows.find { |row| row[:symbol] == ticker.symbol }
            ticker.update(founded_row.except(:status)) if founded_row
          end
        end

        def tickers
          context.tickers
        end

        def parsed_rows
          context.parsed_rows
        end
      end
    end
  end
end
