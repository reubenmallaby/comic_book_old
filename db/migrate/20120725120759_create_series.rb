class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string  :name
      t.text    :description
      t.integer :comic_count, :default => 0
      t.boolean :available,   :default => true
      t.timestamps
    end
  end
end
