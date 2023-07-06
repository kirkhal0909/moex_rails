module Interactors
  module Moex
    module Tactics
      class LastLevelLow < BaseTacticInteractor
        before { context.level_low = {} }

        def call
          from_days.upto(low.length - 1) do |potential_days|
            lows = low[...potential_days].sort
            break unless in_max_difference?(potential_days, lows.first)

            context.level_low = {
              buy: true,
              count: lows.map { |value| in_max_difference?(potential_days, value) }.count(true),
              days: potential_days
            }
          end
        end

        def from_days
          7
        end

        def in_max_difference?(days, value)
          difference = (high_max(days) - low.first) * difference_percent

          value.in?((low.first - difference)..(low.first + difference))
        end

        def difference_percent
          0.05
        end
      end
    end
  end
end
