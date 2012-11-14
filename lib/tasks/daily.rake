task :clear_day do
  p "Clearing daily comic cache"
  ActionController::Base.new.expire_fragment(:controller => 'comics', :action => 'index')

  @comic = Comic.where("publish_date = ? ", Date.today)
  if Settings.uses_facebook and @comic.publish_date <= Date.today
    begin
      koala_page = Koala::Facebook::API.new(Settings.facebook_page_access_token)
      koala_page.put_connections(Settings.facebook_page, 'feed', :message => "New image - #{@comic.name}", :picture => request.protocol + request.host + @comic.image.url(:original), :link => request.protocol + request.host + archived_url(@comic.publish_date.year, @comic.publish_date.month, @comic.publish_date.day))
    rescue Exception => e
      #TODO
      #Notify user that they need to update their access tokens
      logger.info ">>>> ERROR in comic create : #{e.message}"
    end
  end
end
