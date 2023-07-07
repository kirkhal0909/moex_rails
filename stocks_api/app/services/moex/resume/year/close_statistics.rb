module Moex
  module Resume
    module Year
      class CloseStatistics < BaseResume
        def call
          resume.sort_by { |_key, value| value[:list_level] }.to_h
        end

        private

        def resume
          tickers.each_with_object({}) do |ticker, resume|
            scenario = positive_scenario?(ticker)
            resume[ticker.symbol] = { list_level: ticker.list_level } if scenario
          end
        end

        def positive_scenario?(ticker)
          year = start_year
          difference = year_difference(ticker, year)
          count = 0
          while difference
            count += 1 if difference.positive?
            year += 1
            difference = year_difference(ticker, year)
          end
          return false if year == start_year

          (count / (year - start_year).to_f) >= rule_percent
        end

        def rule_percent
          0.7
        end

        def start_year
          2014
        end

        def year_difference(ticker, year)
          date = Date.new(year)
          end_value = ticker.ticker_values.where('date < ?', date + 1.year).first
          start_value = ticker.ticker_values.where('date >= ?', date).last

          return if start_value.blank? || end_value.blank?

          (end_value.close / start_value.open) - 1
        end

        def ticker_values(ticker)
          ticker.ticker_values
        end
      end
    end
  end
end
