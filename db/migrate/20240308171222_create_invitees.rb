class CreateInvitees < ActiveRecord::Migration[7.1]
  def change
    create_table :invitees do |t|
      t.string :email
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
