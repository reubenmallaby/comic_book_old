class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.integer :series_id
      t.string :name
      t.string :description
      t.date :publish_date
      t.boolean :sold, :default => false

      t.timestamps
    end
  end
end
