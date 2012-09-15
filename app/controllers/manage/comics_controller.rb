class Manage::ComicsController < Manage::BaseController

  def index
    @comics = Comic.reversed
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def new
    @comic = Comic.new
    @comic.publish_date=Date.today
    @books = Book.available
  end

  def edit
    @comic = Comic.find(params[:id])
    @books = Book.available
  end

  def create
    @comic = Comic.new(params[:comic])
    if @comic.save

      if Settings.uses.facebook
        #post
      end

      if Settings.uses.twitter
        #post
      end

      redirect_to manage_comics_url, notice: 'Comic was successfully created.'
    else
      @books = Book.available
      render action: "new"
    end
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(params[:comic])
      redirect_to manage_comics_url, notice: 'Comic was successfully updated.'
    else
      @books = Book.available
      render action: "edit"
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to manage_comics_url
  end
end
