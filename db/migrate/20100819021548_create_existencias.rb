class CreateExistencias < ActiveRecord::Migration
  def self.up
    create_table :existencias do |t|
      t.integer :factura_id
      t.integer :activo_id
      t.integer :lote
      t.integer :cantidad
      t.integer :saldo

      t.timestamps
    end
  end

  def self.down
    drop_table :existencias
  end
end
