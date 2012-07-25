class Comment < ActiveRecord::Base
  attr_accessible :comic_id, :message, :user_id

  belongs_to :user
  belongs_to :comic

end
