class CreateAttendings < ActiveRecord::Migration[7.1]
  def change
    create_table :attendings do |t|
      t.references :event_attendee, null: false, foreign_key: { to_table: 'users'}
      t.references :attended_event, null: false, foreign_key: { to_table: 'events'}

      t.timestamps
    end
  end
end
