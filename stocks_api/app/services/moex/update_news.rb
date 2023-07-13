module Moex
  class UpdateNews < ApplicationService
    def initialize(tickers = nil)
      @tickers = tickers
    end

    def call
      update_news if @tickers.blank?

      @tickers&.each { |ticker| update_news(ticker) }
    end

    def update_news(ticker = nil)
      news(ticker).each do |news_block|
        News.create(news_block.except(:symbols))
        news_block[:symbols].each do |symbol|
          NewsTicker.create(ticker_id: Ticker.find_by_symbol(symbol)&.id, news_id: news_block[:id])
        end
      end
    end

    def news(ticker = nil)
      data = client.news({ ticker: ticker&.symbol, take: 100 }.compact)
      Moex::Requests::NewsSerializer.new(data).to_hash
    end

    def client
      @client ||= Moex::Client.new
    end
  end
end
