class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.references :user, foreign_key: true
      t.string :authorized_by

      t.timestamps
    end
  end
end
