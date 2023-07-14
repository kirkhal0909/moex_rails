module Interactors
  module Moex
    module Tickers
      class SearchPeakDates < BaseInteractor
        before { context.peak_dates ||= [] }

        def call
          (ticker_values.length - 1).times { |index| add_date(index) if peak_date?(index) }
        end

        def add_date(index)
          context.peak_dates << ticker_values[index].date
        end

        def peak_date?(index)
          difference(index) > (difference(index + 1) * anomaly_coef)
        end

        def difference(index)
          ticker_values[index].high - ticker_values[index].low
        end

        def anomaly_coef
          context.anomaly_coef || 4
        end

        def ticker_values
          @ticker_values ||= ticker.ticker_values.where('date >= ?', from_date)
        end

        def from_date
          DateTime.now.ago(period)
        end

        def period
          context.period || 2.months
        end

        def ticker
          Ticker.find_by_symbol(context.symbol)
        end
      end
    end
  end
end
