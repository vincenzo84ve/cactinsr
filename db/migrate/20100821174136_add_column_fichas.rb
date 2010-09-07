class AddColumnFichas < ActiveRecord::Migration
  def self.up
    add_column "fichas", "activo_id", :integer
  end

  def self.down
  end
end
