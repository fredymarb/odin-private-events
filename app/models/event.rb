class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendences, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendences, source: :attendee

  has_many :event_invitations, foreign_key: :event_id, dependent: :destroy
  has_many :invitees, through: :event_invitations, source: :invitee
end
