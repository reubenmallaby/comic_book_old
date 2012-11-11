require 'watermark'

class Comic < ActiveRecord::Base

  attr_accessible :description, :name, :publish_date, :series_id, :image, :sold, :book_id

  belongs_to :chapter

  has_attached_file :image,
                    :styles => {
                        :original => {
                            :geometry => '800x600>',
                            :watermark_path => "#{Rails.root}/public/original_watermark.png"
                        },
                        :thumb => {
                            :geometry => '100x100>',
                            :watermark_path => "#{Rails.root}/public/thumb_watermark.png"
                        }
                    },
                    :url => '/comics/:id/:style/:filename',
                    :default_url => "/assets/none_:style.png",
                    :processors => [:watermark]


  validates_presence_of :name, :image
  validates_uniqueness_of :name, :publish_date

  has_many :comments, :as => :commentable

  belongs_to :book
  has_many :taggings
  has_many :tags, :through => :taggings

  after_create :increment_book

  scope :reversed, order("publish_date DESC")
  scope :latest, order("publish_date DESC").limit(1)
  scope :oldest, order("publish_date ASC").limit(1)
  scope :published, where("publish_date <= ?", Date.today)
  scope :for_month, lambda { |date|
    where("publish_date between ? and ?", date, date + 1.month)
  }
  scope :available, where("publish_date <= ? ", Date.today).latest
  scope :before, lambda { |date|
    where("publish_date < ? ", date).
      latest
  }
  scope :after, lambda { |date|
    where("publish_date > ? ", date).
      oldest
  }

  def previous
    Comic.before(self.publish_date).latest.first
  end
  def next
    Comic.after(self.publish_date).oldest.first
  end

  private

  def increment_book
    unless !Settings.uses_books && self.book_id.blank?
      self.book.increment_counter
    end
  end
end
