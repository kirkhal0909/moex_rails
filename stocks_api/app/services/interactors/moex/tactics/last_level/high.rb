module Interactors
  module Moex
    module Tactics
      module LastLevel
        class High < Base
          def sorted_values(potential_days)
            high[...potential_days].sort.reverse
          end

          def buy
            false
          end

          def in_range?(days, value)
            difference = (high.first - low_min(days)) * difference_percent

            value.in?((high.first - difference)..(high.first + difference))
          end
        end
      end
    end
  end
end
