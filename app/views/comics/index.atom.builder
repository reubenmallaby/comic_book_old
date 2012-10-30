atom_feed do |feed|
  feed.title(Settings.site_title)
  feed.updated(@comics.first.publish_date)
  @comics.each do |comic|
    feed.entry(comic) do |entry|
      entry.title(comic.name)
      entry.updated(comic.publish_date.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.url(archived_url(comic.publish_date.year, comic.publish_date.month, comic.publish_date.day))
      entry.content(image_tag(comic.image.url(:thumb)) + "<br>".html_safe + comic.description, :type => 'html')
    end
  end
end
