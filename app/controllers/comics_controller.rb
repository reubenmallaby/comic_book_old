class ComicsController < ApplicationController

  before_filter :get_linked

  def index
    @comics = Comic.latest.limit(10)
    @comic = Comic.latest.first
    get_calendar
  end

  def archive
    @comics = Comic.latest
  end

  def show
    if params[:id]
      @comic = Comic.find(params[:id])
    else
      @comic = Comic.latest.first
    end
    get_calendar
  end

  def show_by_day
    @date = Date.parse "#{params[:day]}-#{params[:month]}-#{params[:year]}"
    @comic = Comic.where(:publish_date => @date).first
    get_calendar
  end

  protected

  def get_linked
    @first  = Comic.oldest.first
    @latest = Comic.latest.first
  end

  def get_calendar
    unless @date
      if @comic
        @date = @comic.publish_date
      else
        @date = Date.today
      end
    end
    @comics_for_month = {}
    Comic.for_month(Date.new(@date.year, @date.month)).each do |c|
      @comics_for_month[c.publish_date.day] = c
    end
    @first_day = Date.new(@date.year, @date.month).wday - 1
    @num_days = Time.days_in_month(@date.month)
  end

end
