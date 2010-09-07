class RemoveColumnsActivos < ActiveRecord::Migration
  def self.up
    remove_column "activos", "es_asignado"
    remove_column "existencias", "lote"
    add_column "existencias", "serial", :string
  end

  def self.down
  end
end
