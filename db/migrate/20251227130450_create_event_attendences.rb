class CreateEventAttendences < ActiveRecord::Migration[8.1]
  def change
    create_table :event_attendences do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.references :attended_event, null: false, foreign_key: { to_table: :events }

      t.timestamps
    end

    add_index :event_attendences, [ :attendee_id, :attended_event_id ], unique: true
  end
end
