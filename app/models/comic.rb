class Comic < ActiveRecord::Base
  attr_accessible :description, :name, :publish_date, :series_id, :sold
end
