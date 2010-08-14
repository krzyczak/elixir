class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :account
      t.string :bank_number
      t.string :street
      t.string :street_no
      t.string :postal_code
      t.string :city

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
