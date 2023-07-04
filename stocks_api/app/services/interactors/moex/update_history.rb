module Interactors
  module Moex
    class UpdateHistory
      include Interactor::Organizer

      organize TickerHistory::Read, TickerHistory::Fetch
    end
  end
end
