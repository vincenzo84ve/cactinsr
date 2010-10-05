class CreateLineasAsignados < ActiveRecord::Migration
  def self.up
    create_table :lineas_asignados do |t|
      t.integer :existencia_id
      t.integer :asignado_id
      t.boolean :esta_activo

      t.timestamps
    end
  end

  def self.down
    drop_table :lineas_asignados
  end
end
