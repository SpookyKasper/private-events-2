class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', inverse_of: 'creator'
  has_many :attendings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :attendings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
