class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
  end
end
