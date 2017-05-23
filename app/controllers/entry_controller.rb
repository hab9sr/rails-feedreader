class EntryController < ApplicationController
  def index
    @categories = Category.all

    if request.format == :html
      @entries = Entry.joins(:feed)
          .where(feeds: { hide_in_all: false })
          .order(published: :desc)
    end

    if request.format == :js
      cat_id = params[:category]
      if cat_id
        @entries = Entry.joins(:feed)
            .where(feeds: { category_id: cat_id })
            .order(published: :desc)
      else
        @entries = Entry.joins(:feed)
            .where(feeds: { hide_in_all: false })
            .order(published: :desc)
      end
    end
  end

  def refresh
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed - #{feed.title}"
    end
    redirect_to root_url
  end

end
