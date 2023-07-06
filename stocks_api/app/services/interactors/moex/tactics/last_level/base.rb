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
                count: values.map { |value| in_range?(potential_days, value) }.count(true),
                days: potential_days
              }
            end
          end

          def from_days
            7
          end

          def difference_percent
            0.05
          end
        end
      end
    end
  end
end
