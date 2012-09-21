xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title Settings.site_title
    xml.description Settings.site_title
    xml.link comics_url

    for comic in @comics
      xml.item do
        xml.title comic.name
        xml.description comic.description
        xml.pubDate comic.publish_date.to_s(:rfc822)
        xml.link archived_url(comic.publish_date.year, comic.publish_date.month, comic.publish_date.day)
        xml.guid archived_url(comic.publish_date.year, comic.publish_date.month, comic.publish_date.day)
      end
    end
  end
end
