class ChangeSentByToStringInInvitations < ActiveRecord::Migration[5.2]
  def change
    change_column :invitations, :sent_by, :string
  end
end
