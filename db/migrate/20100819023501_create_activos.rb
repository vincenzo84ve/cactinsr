class CreateActivos < ActiveRecord::Migration
  def self.up
    create_table :activos do |t|
      t.string :descripcion
      t.integer :marca_id
      t.string :modelo
      t.boolean :es_equipo
      t.boolean :es_asignado

      t.timestamps
    end
  end

  def self.down
    drop_table :activos
  end
end
