class Visit < ActiveRecord::Base
  validates :visitor_id, presence: true
  validates :shortened_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, shortened_url_id: shortened_url.id)
  end

  belongs_to :visitors,
    class_name: :User,
    primary_key: :id,
    foreign_key: :visitor_id

  belongs_to :urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :shortened_url_id

end
