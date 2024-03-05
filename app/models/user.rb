class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', inverse_of: 'creator'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
