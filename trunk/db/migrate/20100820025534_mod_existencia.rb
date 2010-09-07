class ModExistencia < ActiveRecord::Migration
  def self.up
    add_column "existencias", "es_asignado", :boolean
  end

  def self.down
  end
end
