class CreateCareas < ActiveRecord::Migration
  def self.up
    create_table :careas do |t|
      t.string :nombre
      t.integer :cgeneral_id

      t.timestamps
    end
  end

  def self.down
    drop_table :careas
  end
end
