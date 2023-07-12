class News < ApplicationRecord
  has_many :news_tickers
  has_many :tickers, through: :news_tickers
end
