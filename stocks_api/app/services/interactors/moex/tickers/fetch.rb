module Interactors
  module Moex
    module Tickers
      class Fetch < BaseInteractor
        def call
          context.parsed_rows = parsed_rows
        end

        def parsed_rows
          rows.map do |row|
            {
              symbol: row['SECID'],
              name: row['SHORTNAME'], name_full: row['SECNAME'], name_en: row['LATNAME'],
              isin: row['ISIN'],
              list_level: row['LISTLEVEL'],
              sec_type: row['SECTYPE'],
              symbol_type: Ticker.symbol_types['shares'],
              status: row['STATUS'],
              issue_size: row['ISSUESIZE']
            }
          end
        end

        def response
          @response ||= client.tickers_info
        end
      end
    end
  end
end
