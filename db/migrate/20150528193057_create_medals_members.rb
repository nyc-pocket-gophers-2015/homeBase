class CreateMedalsMembers < ActiveRecord::Migration
  def change
    create_table :medals_members do |t|

      t.timestamps null: false
    end
  end
end
