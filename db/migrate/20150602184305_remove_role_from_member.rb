class RemoveRoleFromMember < ActiveRecord::Migration
  def change
    remove_column :members, :role, :string
  end
end
