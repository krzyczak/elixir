class CreateTransfers < ActiveRecord::Migration
  def self.up
    create_table :transfers do |t|
      t.date :date
      t.decimal :quota
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :transfers
  end
end
