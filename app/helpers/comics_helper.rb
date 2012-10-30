module ComicsHelper

  def archived_comic_path comic
    return "#" unless comic
    archived_path(comic.publish_date.year, comic.publish_date.month, comic.publish_date.day)
  end

  def archived_comic_url comic
    return "#" unless comic
    archived_url(comic.publish_date.year, comic.publish_date.month, comic.publish_date.day)
  end

end
