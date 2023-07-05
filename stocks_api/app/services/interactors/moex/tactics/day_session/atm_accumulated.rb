module Interactors
  module Moex
    module Tactics
      module DaySession
        class AtmAccumulated < BaseInteractor
          def call
            context.atm_accumulated = atm_accumulated
          end

          def atm_accumulated
            return if context.atr[0] < context.atr[1] * percent_accumulate

            buy = today_open >= today_close
            check_bounce = buy ? bounce_from_low : bounce_from_high
            return buy if check_bounce <= max_bounce
          end

          def percent_accumulate
            0.75
          end

          %i[open high low close].each do |column|
            define_method "today_#{column}" do
              context.serialize_data[column][0].to_f
            end
          end

          def bounce_from_low
            (today_close - today_low) / today_difference
          end

          def bounce_from_high
            (today_high - today_close) / today_difference
          end

          def today_difference
            today_high - today_low
          end

          def max_bounce
            0.2
          end
        end
      end
    end
  end
end
