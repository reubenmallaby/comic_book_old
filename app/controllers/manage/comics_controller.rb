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
        begin
          koala_page = Koala::Facebook::API.new(Settings.facebook_page_access_token)
          koala_page.put_connections(Settings.facebook_page, 'feed', :message => "New image - #{@comic.name}", :picture => "http://comicbook.mallaby.me#{@comic.image.url(:original)}", :link => archived_url(@comic.publish_date.year, @comic.publish_date.month, @comic.publish_date.day))
        rescue Exception => e
          #TODO
          #Notify user that they need to update their access tokens
          logger.info ">>>> ERROR in comic create : #{e.message}"
        end
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
