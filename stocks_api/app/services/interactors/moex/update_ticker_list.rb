module Interactors
  module Moex
    class UpdateTickerList
      include Interactor::Organizer

      organize Tickers::Fetch, Tickers::Read, Tickers::UpdateExists, Tickers::CreateNew, Tickers::DestroyStatusN
    end
  end
end
