class ModLineasDespachos < ActiveRecord::Migration
  def self.up
    remove_column("lineas_despachos", "depacho_id")
    add_column :lineas_despachos, :despacho_id, :integer
  end

  def self.down
  end
end
