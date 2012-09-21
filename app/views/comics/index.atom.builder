atom_feed do |feed|
  feed.title(Settings.site_title)
  feed.updated(@comics.first.created_at)
  @comics.each do |comic|
    feed.entry(comic) do |entry|
      entry.title(comic.name)
      entry.content(comic.description, :type => 'html')
    end
  end
end
