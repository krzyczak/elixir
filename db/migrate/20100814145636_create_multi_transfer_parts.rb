class CreateMultiTransferParts < ActiveRecord::Migration
  def self.up
    create_table :multi_transfer_parts do |t|
      t.integer :multi_transfer_id
      t.integer :person_id
      t.decimal :quota
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :multi_transfer_parts
  end
end
