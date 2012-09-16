class Chapter < ActiveRecord::Base
  attr_accessible :book_id, :name, :position

  belongs_to :book
  has_many :comics

  def increment_counter
    self.update_attribute :comic_count, self.comic_count + 1
  end

end
