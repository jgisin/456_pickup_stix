module ApplicationHelper

  def bookmarked?(resource)
    !!resource.bookmarks
    #I know it doesn't work like this, no time to write it, but would be bookmark check
  end
end
