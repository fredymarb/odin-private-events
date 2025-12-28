class EventInvitation < ApplicationRecord
  belongs_to :event, class_name: "Event"
  belongs_to :invitee, class_name: "User"

  validates :invitee_id, uniqueness: { scope: :event_id }
end
