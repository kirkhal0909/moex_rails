module Interactors
  module Moex
    module Indicators
      class SerializeData < BaseInteractor
        def call
          context.serialize_data = serialize_data
        end

        def serialize_data
          keys.each_with_object({}) do |key, data|
            data[key.to_sym] = context.actual_history.pluck(key)
          end
        end

        def keys
          context.actual_history.first.keys - %w[created_at updated_at id capitalization ticker_id]
        end
      end
    end
  end
end
