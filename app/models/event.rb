class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendings, source: :event_attendee
  has_many :invitees

  scope :past, -> { where('event_date < ?', Time.now) }
  scope :future, -> { where('event_date > ?', Time.now) }
end
