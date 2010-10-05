class AsginadoRevision < ActiveRecord::Migration
  def self.up
    remove_column "asignados", "existencia_id"
  end

  def self.down
  end
end
