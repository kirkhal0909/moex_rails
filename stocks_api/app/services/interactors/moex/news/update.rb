module Interactors
  module Moex
    module News
      class Update < BaseInteractor
        def call
          ::Moex::UpdateNews.new.call
        end
      end
    end
  end
end
