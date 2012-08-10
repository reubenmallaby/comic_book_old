class Comment < ActiveRecord::Base
  attr_accessible :comic_id, :message, :user_id

  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  scope :reversed, order("created_at DESC")

end
