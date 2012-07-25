class SeriesController < ApplicationController

  # GET /series
  # GET /series.json
  def index
    @series = Serie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @series }
    end
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @series = Serie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @series }
    end
  end

end
