class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :artist, null: false
      t.string :name, null: false
      t.date :release_date, null: false
      t.decimal :stars, null: false
      t.integer :sales, null: false

      t.timestamps
    end
  end
end
