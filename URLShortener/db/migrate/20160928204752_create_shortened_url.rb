class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id
      t.string :long_url, null: false
      t.string :short_url

      t.index :short_url, unique: true
      t.index :long_url, unique: true
    end
  end
end
