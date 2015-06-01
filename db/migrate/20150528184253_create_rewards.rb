class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
    	t.string :name, null: false
    	t.integer :cost, null: false
    	t.string :category
    	t.integer :family_id, null: false
    	t.integer :member_id, null: false
      t.string :status, default: "open"

      t.timestamps null: false
    end
  end
end
