class Dentist < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :registration_status, presence: true

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at && published_at > Time.current
  end

end
