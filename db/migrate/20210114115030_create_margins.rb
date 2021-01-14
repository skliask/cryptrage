class CreateMargins < ActiveRecord::Migration[6.1]
  def change
    create_table :margins do |t|
      t.integer :base_id, null: false
      t.integer :quote_id, null: false
      t.decimal :margin, :decimal, precision: 20, scale: 10, default: "0", null: false

      t.timestamps
    end
  end
end
