class ChangeSentToToStringInInvitations < ActiveRecord::Migration[5.2]
  def change
    change_column :invitations, :sent_to, :string
  end
end
