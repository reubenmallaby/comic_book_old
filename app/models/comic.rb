class Comic < ActiveRecord::Base

  attr_accessible :description, :name, :publish_date, :series_id, :image, :sold

  belongs_to :serie

  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "100x100>" },
                    :url => '/comics/:id/:style/:filename'

  has_one :previous, :class_name => "Comic", :foreign_key => "previous_id"
  has_one :next,     :class_name => "Comic", :foreign_key => "next_id"

  has_many :comments

  after_create :increment_serie

  scope :latest, order("publish_date DESC").limit(1)
  scope :oldest, order("publish_date ASC").limit(1)
  scope :published, where("publish_date <= ?", Date.today)
  scope :for_month, lambda { |date|
    where("publish_date between ? and ?", date, date + 1.month)
  }
  scope :before, lambda { |date|
    where("publish_date > ? ", date).
      latest
  }
  scope :after, lambda { |date|
    where("publish_date < ? ", date).
      oldest
  }



  private

  def increment_serie
    unless self.serie.blank?
      self.serie.increment_counter
    end
  end
end
