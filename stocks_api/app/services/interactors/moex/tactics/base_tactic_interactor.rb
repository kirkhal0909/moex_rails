module Interactors
  module Moex
    module Tactics
      class BaseTacticInteractor < BaseInteractor
        def last_difference
          ((close.first / open.first) - 1).round(2)
        end

        def open
          context.serialize_data[:open]
        end

        def high_max(days = 1)
          high[...days].max
        end

        def high
          context.serialize_data[:high]
        end

        def low_min(days = 1)
          low[...days].min
        end

        def low
          context.serialize_data[:low]
        end

        def close
          context.serialize_data[:close]
        end

        def volume
          context.serialize_data[:volume]
        end
      end
    end
  end
end
