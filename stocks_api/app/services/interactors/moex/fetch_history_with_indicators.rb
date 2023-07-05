module Interactors
  module Moex
    class FetchHistoryWithIndicators
      include Interactor::Organizer

      organize FetchActualHistory, Indicators::SerializeData, Indicators::Atr
    end
  end
end
