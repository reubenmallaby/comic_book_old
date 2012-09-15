class Post < ActiveRecord::Base
  attr_accessible :content, :title

  has_many :comments, :as => :commentable
  has_many :taggings, :as => :tagged
  has_many :tags, :through => :taggings

  default_scope order("created_at desc")

end
