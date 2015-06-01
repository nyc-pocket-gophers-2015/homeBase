class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
    	t.string :surname, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
