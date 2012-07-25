class Serie < ActiveRecord::Base
  attr_accessible :available, :description, :name

  has_many :comics

  scope :available, where(:available => true)

  def increment_counter
    self.update_attribute :comic_count, self.comic_count + 1
  end

end
