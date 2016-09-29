class User < ActiveRecord::Base
  validates :email, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  # has_many :visited_urls,
  #   class_name: :ShortenedUrl,
  #   primary_key: :id,
  #   foreign_key: :visitor_id

  has_many :urls,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :Visit

  has_many :visited_urls, -> { distinct }, :through => :urls, :source => :urls
end
