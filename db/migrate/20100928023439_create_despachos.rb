class CreateDespachos < ActiveRecord::Migration
  def self.up
    create_table :despachos do |t|
      t.integer :persona_id
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :despachos
  end
end
