class AddLinksToComic < ActiveRecord::Migration
  def change
    add_column :comics, :previous_id, :integer
    add_column :comics, :next_id, :integer
  end
end
