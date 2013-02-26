desc "Updates to latest comic"
task :clear_day => :environment do |t, args|
  include Rails.application.routes.url_helpers
  #p "Clearing daily comic cache"
  #begin
  #  ActionController::Base.new.expire_fragment(:controller => 'comics', :action => 'index')
  #rescue Exception => e
  #  puts e.message
  #end
  #p "1"
  default_url_options[:host] = Settings.host
  comic = Comic.where("publish_date = ? ", Date.today).latest.first
  p "A"
  if comic and Settings.uses_facebook and comic.publish_date <= Date.today
    begin
      p "B"
      koala_page = Koala::Facebook::API.new(Settings.facebook_page_access_token)
      p "C #{koala_page}"
      koala_page.put_connections(Settings.facebook_page, 'feed', 
        :message => "New image - #{comic.name}", 
        :picture => "http://" + Settings.host + "/" + comic.image.url(:original), 
        :link => "http://" + Settings.host + "/" + archived_url(comic.publish_date.year, 
          comic.publish_date.month, comic.publish_date.day))
    rescue Exception => e
      #TODO
      #Notify user that they need to update their access tokens
      p ">>>> ERROR in comic create : #{e.message} ::: #{Settings.host} ::: "
    end
  end
  p "D"
end

