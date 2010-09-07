class Existencia < ActiveRecord::Base
  belongs_to :factura
  belongs_to :activo
end
