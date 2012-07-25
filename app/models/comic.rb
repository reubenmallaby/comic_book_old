class Comic < ActiveRecord::Base
  attr_accessible :description, :name, :publish_date, :series_id, :image, :sold

  belongs_to :serie

  has_attached_file :image,
                    :styles => { :medium => "240x240>", :thumb => "80x80>" },
                    :url => '/comics/:id/:style/:filename'

  after_create :increment_serie

  scope :latest, order("publish_date DESC")




  private

  def increment_serie
    unless self.serie.blank?
      self.serie.increment_counter
    end
  end
end
