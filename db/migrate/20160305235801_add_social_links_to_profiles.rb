class AddSocialLinksToProfiles < ActiveRecord::Migration[4.2]
  def change
    add_column :profiles, :twitter_url, :string
    add_column :profiles, :linkedin_url, :string
    add_column :profiles, :github_url, :string
  end
end
