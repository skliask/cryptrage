class CreateMarkets < ActiveRecord::Migration[6.1]
  def change
    create_table :markets do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
  end
end
