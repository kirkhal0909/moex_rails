module Interactors
  module Moex
    class UpdateTickerList
      include Interactor::Organizer

      organize Tickers::Fetch, Tickers::ReadTickers, Tickers::UpdateExists, Tickers::CreateNew
    end
  end
end
