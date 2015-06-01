class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
    	t.string :role, null: false
    	t.string :name, null: false
    	t.integer :family_id, null: false
    	t.integer :task_points, default: 0
    	t.string :color
    	t.string :img_url, default: "http://media.giphy.com/media/F5njAlGB0wpy/giphy.gif"

      t.timestamps null: false
    end
  end
end
