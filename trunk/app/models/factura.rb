class Factura < ActiveRecord::Base
  belongs_to :proveedor
  has_many :existencias
end
