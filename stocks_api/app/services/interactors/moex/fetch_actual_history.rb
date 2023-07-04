module Interactors
  module Moex
    class FetchActualHistory
      include Interactor::Organizer

      organize UpdateHistory, TickerHistory::Read, TickerHistory::LastDay::Fetch, TickerHistory::LastDay::Combine
    end
  end
end
