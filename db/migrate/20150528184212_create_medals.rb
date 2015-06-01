class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
    	t.string :title, null: false
    	t.string :img_url, null: false

      t.timestamps null: false
    end
  end
end
