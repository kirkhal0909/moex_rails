module Interactors
  module Moex
    class FetchHistoryWithTactics
      include Interactor::Organizer

      organize FetchActualHistory, Indicators::SerializeData, Indicators::BounceInfo,
               Indicators::Atr, Indicators::AtrCustom, Tactics::DaySession::AtrAccumulated
    end
  end
end