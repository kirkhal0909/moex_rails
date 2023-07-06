module Interactors
  module Moex
    module Tickers
      class DestroyStatusN < BaseInteractor
        def call
          parsed_rows.select { |row| row[:status] == 'N' }.each do |row|
            Ticker.find_by(symbol: row[:symbol])&.destroy
          end
        end

        def parsed_rows
          context.parsed_rows
        end
      end
    end
  end
end
