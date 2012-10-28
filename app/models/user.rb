class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :token_authenticatable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  has_many :comments

  attr_accessible :name, :email, :provider, :uid

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

end
