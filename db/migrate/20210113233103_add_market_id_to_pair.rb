class AddMarketIdToPair < ActiveRecord::Migration[6.1]
  def change
    add_column :pairs, :market_id, :integer
    drop_table :pairs_markets
  end
end
