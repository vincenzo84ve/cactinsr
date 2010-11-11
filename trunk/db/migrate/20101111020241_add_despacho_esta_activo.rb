class AddDespachoEstaActivo < ActiveRecord::Migration
  def self.up
    add_column :despachos, :esta_activo, :boolean
  end

  def self.down
    remove_column("despachos", "esta_activo")
  end
end
