module Interactors
  module Moex
    class FetchHistoryWithTactics
      include Interactor::Organizer

      organize FetchActualHistory, Indicators::SerializeData,
               Indicators::Atr, Tactics::DaySession::AtmAccumulated
    end
  end
end
