class CreateLineasDespachos < ActiveRecord::Migration
  def self.up
    create_table :lineas_despachos do |t|
      t.integer :existencia_id
      t.integer :depacho_id
      t.integer :cantidad
      t.boolean :esta_activo

      t.timestamps
    end
  end

  def self.down
    drop_table :lineas_despachos
  end
end
