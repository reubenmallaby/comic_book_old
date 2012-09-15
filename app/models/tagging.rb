class Tagging < ActiveRecord::Base
  attr_accessible :tag_id, :tagged_id, :tagged_type

  belongs_to :tag
  has_many :tagged, :polymorphic => true

end
