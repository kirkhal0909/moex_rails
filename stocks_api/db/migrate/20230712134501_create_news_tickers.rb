class CreateNewsTickers < ActiveRecord::Migration[7.0]
  def change
    create_table :news_tickers do |t|
      t.integer :ticker_id
      t.string :news_id
    end

    add_index :news_tickers, %i[ticker_id news_id], unique: true
  end
end
