class CreatePersonas < ActiveRecord::Migration
  def self.up
    create_table :personas do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido
      t.string :cargo
      t.integer :carea_id
      t.integer :ubicacione_id

      t.timestamps
    end
  end

  def self.down
    drop_table :personas
  end
end
