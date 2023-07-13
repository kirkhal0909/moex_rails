class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news, id: :string do |t|
      t.string :url
      t.integer :likes
      t.string :client
      t.string :client_id
      t.datetime :date
      t.text :message

      t.timestamps
    end

    add_index :news, :date
  end
end
