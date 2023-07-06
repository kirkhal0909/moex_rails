module Interactors
  module Moex
    module Tactics
      module LastLevel
        class Base < BaseTacticInteractor
          before { context.level ||= {} }

          def call
            from_days.upto(low.length - 1) do |potential_days|
              values = sorted_values(potential_days)
              break unless in_range?(potential_days, values.first)

              context.level = {
                buy: buy,
                count: count(potential_days, values),
                days: potential_days,
                changed: last_difference,
                volume: volume.first.to_i
              }
            end
          end

          def count(potential_days, values)
            values.map { |value| in_range?(potential_days, value) }.count(true)
          end

          def from_days
            7
          end

          def difference_percent
            0.1
          end
        end
      end
    end
  end
end
