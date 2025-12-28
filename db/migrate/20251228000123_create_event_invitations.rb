class CreateEventInvitations < ActiveRecord::Migration[8.1]
  def change
    create_table :event_invitations do |t|
      t.references :event, null: false, foreign_key: { to_table: :events }
      t.references :invitee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
