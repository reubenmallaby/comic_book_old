class Manage::SeriesController < Manage::BaseController

  def index
    @series = Serie.all
  end

  def show
    @series = Serie.find(params[:id])
  end

  def new
    @series = Serie.new
  end

  def edit
    @series = Serie.find(params[:id])
  end

  def create
    @series = Serie.new(params[:series])
    if @series.save
      redirect_to [:manage, @series], notice: 'Series was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @series = Serie.find(params[:id])
    if @series.update_attributes(params[:series])
      redirect_to [:manage, @series], notice: 'Series was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @series = Serie.find(params[:id])
    @series.destroy
    redirect_to manage_series_url
  end
end
