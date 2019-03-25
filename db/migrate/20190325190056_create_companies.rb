class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :website
      t.string :name
      t.text :technologies
      t.text :contacts
      t.text :cover_letter
      t.text :notes
      t.text :summary
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
