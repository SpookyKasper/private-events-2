class CreateAttendings < ActiveRecord::Migration[7.1]
  def change
    create_table :attendings do |t|
      t.references :event_attendee, null: false, foreign_key: true
      t.references :attended_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
