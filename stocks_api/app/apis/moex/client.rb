module Moex
  class Client < BaseClient
    base_uri config.dig(:base_uri)

    def ticker_history(ticker, params = {})
      get("#{config[:ticker_history]}#{ticker}", params)
    end

    def tickers_info(params = {})
      get(config[:tickers_info], params)
    end
  end
end
