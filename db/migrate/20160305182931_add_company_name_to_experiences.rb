class AddCompanyNameToExperiences < ActiveRecord::Migration[4.2]
  def change
    add_column :experiences, :company_name, :string
  end
end
