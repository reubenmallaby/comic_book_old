class CreateAddImageToComics < ActiveRecord::Migration
  def self.up
    add_attachment :comics, :image
  end

  def self.down
    remove_attachment :comics, :image
  end
end
