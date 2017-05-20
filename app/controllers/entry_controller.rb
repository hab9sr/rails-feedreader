class EntryController < ApplicationController
  def index
    if request.format == :html
      refresh_feeds
      @categories = Category.all
      @entries = Entry.all.order(published: :desc)
    end

    if request.format == :js
      cat_id = params[:category]
      if cat_id
        @entries = Entry.joins(:feed)
            .where(feeds: { category_id: cat_id })
            .order(published: :desc)
      else
        @entries = Entry.all.order(published: :desc)
      end
    end
  end

  private

    def refresh_feeds
      Feed.all.each do |feed|
        content = Feedjira::Feed.fetch_and_parse feed.url
        content.entries.each do |entry|
          local_entry = feed.entries.where(title: entry.title).first_or_initialize
          local_entry.update_attributes(url: entry.url, published: entry.published)
          p "Synced Entry - #{entry.title}"
        end
        p "Synced Feed - #{feed.title}"
      end
    end

end
