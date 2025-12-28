class AddUniqueIndexToEventInvitations < ActiveRecord::Migration[8.1]
  def change
    add_index :event_invitations, [ :event_id, :invitee_id ], unique: true
  end
end
