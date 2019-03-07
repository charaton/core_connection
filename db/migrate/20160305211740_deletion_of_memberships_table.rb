class DeletionOfMembershipsTable < ActiveRecord::Migration[4.2]
  def change
    drop_table :memberships
  end
end
