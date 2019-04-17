class AddJobPostLinkToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :job_post_link, :string
  end
end
