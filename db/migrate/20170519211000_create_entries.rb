class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :feed, foreign_key: true
      t.string :title
      t.string :url
      t.datetime :published

      t.timestamps
    end
  end
end
