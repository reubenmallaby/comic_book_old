class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :book_id
      t.string :name
      t.integer :position, :default => 1

      t.timestamps
    end
  end
end
