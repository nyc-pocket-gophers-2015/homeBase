class AddFieldsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :sash_id, :integer
    add_column :members, :level,   :integer, :default => 0
  end
end
