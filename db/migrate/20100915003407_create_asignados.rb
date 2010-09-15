class CreateAsignados < ActiveRecord::Migration
  def self.up
    create_table :asignados do |t|
      t.date :fecha
      t.integer :persona_id
      t.integer :existencia_id
      t.boolean :esta_activo

      t.timestamps
    end
  end

  def self.down
    drop_table :asignados
  end
end
