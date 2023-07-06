module Interactors
  module Moex
    module Tactics
      module LastLevel
        class Low < Base
          def sorted_values(potential_days)
            low[...potential_days].sort
          end

          def buy
            true
          end

          def in_range?(days, value)
            difference = (high_max(days) - low.first) * difference_percent

            value.in?((low.first - difference)..(low.first + difference))
          end
        end
      end
    end
  end
end
