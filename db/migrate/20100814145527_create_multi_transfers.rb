class CreateMultiTransfers < ActiveRecord::Migration
  def self.up
    create_table :multi_transfers do |t|
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :multi_transfers
  end
end
