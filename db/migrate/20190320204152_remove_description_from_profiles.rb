class RemoveDescriptionFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :description, :text
  end
end
