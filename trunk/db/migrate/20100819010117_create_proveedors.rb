class CreateProveedors < ActiveRecord::Migration
  def self.up
    create_table :proveedors do |t|
      t.string :nombre
      t.string :rif
      t.string :direccion
      t.string :contacto
      t.string :telefono

      t.timestamps
    end
  end

  def self.down
    drop_table :proveedors
  end
end
