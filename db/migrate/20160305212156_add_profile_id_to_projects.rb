class AddProfileIdToProjects < ActiveRecord::Migration[4.2]
  def change
    add_reference :projects, :profile, index: true, foreign_key: true
  end
end
