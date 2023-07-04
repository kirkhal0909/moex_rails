module Moex
  class TickerLoadHistoryService < BaseService
    attr_reader :symbol

    def initialize(client, symbol)
      @symbol = symbol
      super(client)
    end

    def call
      TickerValue.create(parsed_rows)
    end

    def parsed_rows
      @parsed_rows ||= rows.map do |row|
        {
          ticker_id: ticker.id,
          date: row['TRADEDATE'],
          open: row['OPEN'], low: row['LOW'], high: row['HIGH'], close: row['CLOSE'],
          volume: row['VOLUME'],
          value: row['VALUE'],
          capitalization: 0
        }
      end
    end

    def ticker
      @ticker ||= Ticker.find_by(symbol: symbol)
    end

    def response
      @response ||= client.ticker_history(symbol, { from_date: (Date.today - 90.days).iso8601 })
    end
  end
end
