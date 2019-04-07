class AddJobTitleToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :job_title, :string
  end
end
