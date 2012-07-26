class Manage::ComicsController < Manage::BaseController

  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def new
    @comic = Comic.new
    @series = Serie.available
  end

  def edit
    @comic = Comic.find(params[:id])
    @series = Serie.available
  end

  def create
    @comic = Comic.new(params[:comic])
    @comic.previous = Comic.before(@comic.publish_date).first
    @comic.next = Comic.after(@comic.publish_date).first
    if @comic.save
      redirect_to manage_comics_url, notice: 'Comic was successfully created.'
    else
      @series = Serie.available
      render action: "new"
    end
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(params[:comic])
      redirect_to manage_comics_url, notice: 'Comic was successfully updated.'
    else
      @series = Serie.available
      render action: "edit"
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to manage_comics_url
  end
end
