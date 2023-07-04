module Moex
  class UpdateHistories < ApplicationService
    def initialize(symbols = nil)
      @symbols = symbols
    end

    def call
      symbols.each { |symbol| Interactors::Moex::UpdateHistory.call(symbol: symbol) }
    end

    private

    def symbols
      @symbols || Ticker.pluck(:symbol)
    end
  end
end
