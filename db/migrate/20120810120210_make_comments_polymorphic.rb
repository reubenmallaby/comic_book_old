class MakeCommentsPolymorphic < ActiveRecord::Migration
  def up
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer

    Comment.all.each do |comment|
      comment.update_attribute(:commentable_id, comment.comic_id)
      comment.update_attribute(:commentable_type, 'Comic')
    end

    remove_column :comments, :comic_id
  end

  def down
    add_column :comments, :comic_id, :integer
    Comment.all.each do |comment|
      comment.update_attribute(:comic_id, comment.commentable_id)
    end
    remove_column :comments, :commentable_type
    remove_column :comments, :commentable_id
  end
end
