class AddColumnFactura < ActiveRecord::Migration
  def self.up
    add_column "facturas", "factura", :integer
  end

  def self.down
  end
end
