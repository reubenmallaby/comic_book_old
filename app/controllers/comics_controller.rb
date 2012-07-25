class ComicsController < ApplicationController

  def index
    @comics = Comic.latest.limit(10 )
    @comic = Comic.latest.first
  end

  def show
    if params[:id]
      @comic = Comic.find(params[:id])
    else
      @comic = Comic.latest.first
    end
  end

  def show_by_day
    begin
      @date = Date.parse "#{params[:day]}-#{params[:month]}-#{params[:year]}"
      @comic = Comic.where(:publish_date => @date).first
    rescue Exception => e
      raise ActionController::RoutingError.new('No comic found')
      #render :text => "#{e.message} ..............  #{params.inspect}"
    end
  end

end
