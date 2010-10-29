class LineasDesasignados < ActiveRecord::Migration
  def self.up
    add_column :lineas_asignados, :desasignado_id, :integer
  end

  def self.down
    remove_column("lineas_asignados", "desasignado_id")
  end
end
