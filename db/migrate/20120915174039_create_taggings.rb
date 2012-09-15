class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :tagged_id
      t.string :tagged_type

      t.timestamps
    end
  end
end
