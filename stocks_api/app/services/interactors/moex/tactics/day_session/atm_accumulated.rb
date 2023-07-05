module Interactors
  module Moex
    module Tactics
      module DaySession
        class AtmAccumulated < BaseInteractor
          def call
            context.atm_buy = atm_accumulated
          end

          def atm_accumulated
            return if context.atr[0] < context.atr[1] * percent_accumulate

            buy = context.today_percent.negative?
            check_bounce = buy ? context.bounce_from_low : context.bounce_from_high
            return buy if check_bounce <= max_bounce
          end

          def percent_accumulate
            0.75
          end

          def max_bounce
            0.2
          end
        end
      end
    end
  end
end
