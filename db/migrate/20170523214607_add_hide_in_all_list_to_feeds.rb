class AddHideInAllListToFeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :feeds, :hide_in_all, :boolean
  end
end
