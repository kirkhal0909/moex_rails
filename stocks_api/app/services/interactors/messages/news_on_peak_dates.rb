module Interactors
  module Messages
    class NewsOnPeakDates
      include Interactor::Organizer

      organize Moex::Tickers::SearchPeakDates, Moex::News::ReadPeakDates, News::ReadMessages
    end
  end
end
