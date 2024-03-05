class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :attendings, source: :event_attendee

  def self.past
    self.where('event_date < ?', Time.now)
  end

  def self.future
    self.where('event_date > ?', Time.now)
  end
end
