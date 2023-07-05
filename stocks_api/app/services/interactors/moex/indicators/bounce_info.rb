module Interactors
  module Moex
    module Indicators
      class BounceInfo < BaseInteractor
        def call
          context.today_difference = today_high - today_low
          context.bounce_from_low = (today_close - today_low) / context.today_difference
          context.bounce_from_high = (today_high - today_close) / context.today_difference
          context.today_percent = (today_close / today_open.to_f) - 1
        end

        %i[open high low close].each do |column|
          define_method "today_#{column}" do
            context.serialize_data[column][0].to_f
          end
        end
      end
    end
  end
end
