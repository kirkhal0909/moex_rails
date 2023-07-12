class NewsTicker < ApplicationRecord
  self.primary_key = :ticker_id

  belongs_to :news
  belongs_to :ticker
end
