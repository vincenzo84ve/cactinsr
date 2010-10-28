class CreateLineasDesasignados < ActiveRecord::Migration
  def self.up
    create_table :lineas_desasignados do |t|
      t.integer :desasignado_id
      t.integer :existencia_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lineas_desasignados
  end
end
