class User < ActiveRecord::Base
  include Clearance::User

  attr_accessible :name, :email

end
