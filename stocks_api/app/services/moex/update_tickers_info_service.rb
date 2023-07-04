module Moex
  class UpdateTickersInfoService < BaseService
    def call
      tickers_update
      Ticker.create(rows_new)
    end

    def tickers_update
      tickers.each do |ticker|
        founded_row = parsed_rows.find { |row| row[:symbol] == ticker.symbol }
        ticker.update(founded_row) if founded_row
      end
    end

    def rows_new
      parsed_rows.select { |row| ticker_list.exclude?(row[:symbol]) }
    end

    def parsed_rows
      @parsed_rows ||= rows.map do |row|
        {
          symbol: row['SECID'],
          name: row['SHORTNAME'], name_full: row['SECNAME'], name_en: row['LATNAME'],
          isin: row['ISIN'],
          list_level: row['LISTLEVEL'],
          sec_type: row['SECTYPE'],
          symbol_type: Ticker.symbol_types['symbol_shares']
        }
      end
    end

    def ticker_list
      @ticker_list ||= tickers.pluck('symbol')
    end

    def tickers
      @tickers ||= Ticker.all
    end

    def response
      @response ||= client.tickers_info
    end
  end
end
