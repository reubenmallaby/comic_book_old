class User < ActiveRecord::Base
  include Clearance::User

  has_many :comments

  attr_accessible :name, :email

end
