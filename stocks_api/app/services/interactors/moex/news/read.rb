module Interactors
  module Moex
    module News
      class Read < BaseInteractor
        def call
          context.news = ::News.where('date > ?', DateTime.now - capture_time)
                               .joins(:tickers)
                               .where(tickers: { list_level: list_levels }).reverse
        end

        def capture_time
          context.capture_time || 15.minutes
        end

        def list_levels
          context.list_levels || [3]
        end
      end
    end
  end
end
