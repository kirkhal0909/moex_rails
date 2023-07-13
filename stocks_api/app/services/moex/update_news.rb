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
        tickers_in_news = Ticker.where(symbol: news_block[:symbols])
        next if tickers_in_news.blank?

        News.create(news_block.except(:symbols))
        tickers_in_news.pluck(:id).each do |ticker_id|
          NewsTicker.create(ticker_id: ticker_id, news_id: news_block[:id])
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
