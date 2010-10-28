class CreateDesasignados < ActiveRecord::Migration
  def self.up
    create_table :desasignados do |t|
      t.date :fecha
      t.integer :asignado_id
      t.integer :motivo_id
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :desasignados
  end
end
