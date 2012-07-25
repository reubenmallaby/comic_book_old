class Comic < ActiveRecord::Base
  attr_accessible :description, :name, :publish_date, :series_id#, :sold

  belongs_to :serie

  after_create :increment_serie

  private

  def increment_serie
    unless self.serie.blank?
      self.serie.increment_counter
    end
  end
end
