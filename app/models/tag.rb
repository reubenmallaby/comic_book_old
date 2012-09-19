class Tag < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :taggings
  has_many :comics, :through => :taggings


end
