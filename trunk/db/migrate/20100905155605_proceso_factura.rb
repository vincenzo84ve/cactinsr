class ProcesoFactura < ActiveRecord::Migration
  def self.up
    add_column :facturas, :estado, :string
    add_column :existencias, :esta_activo, :boolean
  end

  def self.down
    remove_column :existencias, :esta_activo
    remove_column :facturas, :estado
  end
end
