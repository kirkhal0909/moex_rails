class NewsTicker < ApplicationRecord
  belongs_to :news
  belongs_to :ticker

  validates :ticker_id, uniqueness: { scope: :news_id }
end
