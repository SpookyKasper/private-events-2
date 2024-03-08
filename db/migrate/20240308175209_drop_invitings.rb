class DropInvitings < ActiveRecord::Migration[7.1]
  def change
    drop_table :invitings
  end
end
