class ShortenedUrl < ActiveRecord::Base
  validates :long_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true

  def self.random_code
    rand_code = SecureRandom::urlsafe_base64
    while ShortenedUrl.exists?(short_url: rand_code)
      rand_code = SecureRandom::urlsafe_base64
    end
    rand_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    raise "long url cannot be null" if long_url.nil?
    shortened = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: shortened)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits
    -> { distinct }

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.count
  end

  def num_recent_uniques(time)
    visits.select(:visitor_id).distinct.where("created_at > ?", time.minutes.ago).count
  end

end
