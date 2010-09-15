class Existencia < ActiveRecord::Base
  belongs_to :factura
  belongs_to :activo
  has_many :asignados
end
