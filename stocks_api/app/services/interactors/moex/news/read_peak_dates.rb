module Interactors
  module Moex
    module News
      class ReadPeakDates < BaseInteractor
        def call
          context.news = ::News.joins(:news_tickers)
                               .where('DATE(date) IN (?)', dates)
                               .where(news_tickers: { ticker_id: ticker.id }).reverse
        end

        def dates
          @dates ||= (context.peak_dates + context.peak_dates.map { |date| date - 1.day }).uniq
        end

        def capture_time
          context.capture_time || 15.minutes
        end

        def ticker
          Ticker.find_by_symbol(context.symbol)
        end
      end
    end
  end
end
