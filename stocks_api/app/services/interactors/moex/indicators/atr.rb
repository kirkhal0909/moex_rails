require 'indicator'

module Interactors
  module Moex
    module Indicators
      class Atr < BaseInteractor
        def call
          context.atr = indicator.run(
            context.serialize_data[:open],
            context.serialize_data[:high],
            context.serialize_data[:low],
            context.serialize_data[:close],
            context.serialize_data[:volume]
          )
        end

        def indicator
          Indicator.create_named(:atr_5)
        end
      end
    end
  end
end
