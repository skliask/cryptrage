class CreatePairsMarkets < ActiveRecord::Migration[6.1]
  def change
    create_table :pairs_markets do |t|
      t.references :pair, null: false, foreign_key: true
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end

    remove_column :pairs, :market_id, :integer
  end
end
