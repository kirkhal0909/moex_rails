class CreateNewsTickers < ActiveRecord::Migration[7.0]
  def change
    create_table :news_tickers, id: false, primary_key: %i[ticker_id news_id] do |t|
      t.integer :ticker_id
      t.string :news_id
    end
  end
end
