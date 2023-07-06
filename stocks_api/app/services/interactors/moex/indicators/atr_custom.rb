require 'indicator'

module Interactors
  module Moex
    module Indicators
      class AtrCustom < BaseInteractor
        def call
          context.atr_custom = length.times.map do |pos|
            context.serialize_data[:high][pos] - context.serialize_data[:low][pos]
          end
        end

        def length
          context.serialize_data[:high].length
        end
      end
    end
  end
end
