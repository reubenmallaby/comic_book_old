class User < ActiveRecord::Base
  include Clearance::User

  has_many :comments

  attr_accessible :name, :email

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

end
