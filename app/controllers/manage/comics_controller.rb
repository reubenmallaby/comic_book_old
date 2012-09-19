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
    @tags = Tag.all
  end

  def edit
    @comic = Comic.find(params[:id])
    @books = Book.available
    @tags = Tag.all
  end

  def create
    @comic = Comic.new(params[:comic])
    params[:tags].split(',').delete_if {|t| t.blank?}.each do |tag|
      @comic.taggings.build( :tag_id => tag )
    end
    if @comic.save

      if Settings.uses_facebook
        #post
      end

      if Settings.uses_twitter
        #post
      end

      redirect_to manage_comics_url, notice: 'Comic was successfully created.'
    else
      @books = Book.available
      @tags = Tag.all
      render action: "new"
    end
  end

  def update
    @comic = Comic.find(params[:id])
    params[:tags].split(',').delete_if {|t| t.blank?}.each do |tag|
      @comic.taggings.build( :tag_id => tag ) if @comic.tags.where(:id => tag).blank?
    end
    if @comic.update_attributes(params[:comic])
      redirect_to manage_comics_url, notice: 'Comic was successfully updated.'
    else
      @books = Book.available
      @tags = Tag.all
      render action: "edit"
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to manage_comics_url
  end
end
