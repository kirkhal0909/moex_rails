class News < ApplicationRecord
  has_many :news_tickers
  has_many :tickers, through: :news_tickers

  validates :id, uniqueness: true
  default_scope { order(date: :desc) }
end
