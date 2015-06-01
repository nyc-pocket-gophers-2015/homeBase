class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title, null: false
    	t.date :event_date, null: false
    	t.time :event_time, null: false
    	t.integer :member_id
    	t.integer :family_id, null:false

      t.timestamps null: false
    end
  end
end
