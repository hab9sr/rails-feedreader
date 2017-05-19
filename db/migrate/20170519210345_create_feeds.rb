class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.string :author
      t.string :url

      t.timestamps
    end
  end
end
