class Post < ActiveRecord::Base
  attr_accessible :content, :title

  has_many :comments, :as => :commentable
  has_many :taggings, :as => :tagged

  default_scope order("created_at desc")

end
