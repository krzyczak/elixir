class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :company_name
      t.string :street
      t.string :street_no
      t.string :postal_code
      t.string :city

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
