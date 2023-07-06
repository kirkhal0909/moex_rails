module Interactors
  module Moex
    class FetchHistoryWithTactics
      include Interactor::Organizer

      organize FetchActualHistory, Indicators::SerializeData, Indicators::BounceInfo,
               Indicators::Atr, Indicators::AtrCustom,
               Tactics::DaySession::AtrAccumulated, Tactics::LastLevel::Low, Tactics::LastLevel::High
    end
  end
end
