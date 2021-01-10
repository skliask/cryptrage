class CreatePairs < ActiveRecord::Migration[6.1]
  def change
    create_table :pairs do |t|
      t.string :name
      t.string :slug
      t.integer :base_id, null: false
      t.integer :quote_id, null: false
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
