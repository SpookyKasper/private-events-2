class RenameEmailAddressToEmailInInvitees < ActiveRecord::Migration[7.1]
  def change
    rename_column :invitees, :email_address, :email
  end
end
