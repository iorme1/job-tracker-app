class AddSentByToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :sent_by, :integer
  end
end
