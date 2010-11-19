class Existencia < ActiveRecord::Base
  belongs_to :factura
  belongs_to :activo
  has_many :lienas_asignados
  has_many :lineas_despachos
end
