class Post < ActiveRecord::Base
  attr_accessible :content, :title

  has_many :comments, :as => :commentable

  default_scope order("created_at desc")

end
